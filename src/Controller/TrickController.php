<?php

namespace App\Controller;

use App\Entity\Media;
use App\Entity\Message;
use App\Entity\Trick;
use App\Form\MessageType;
use App\Form\TrickType;
use App\Repository\TrickRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\ExpressionLanguage\Expression;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Component\String\Slugger\SluggerInterface;

#[Route('/trick')]
class TrickController extends AbstractController
{
    #[Route('/', name: 'app_trick_index', methods: ['GET'])]
    public function index(TrickRepository $trickRepository): Response
    {
        return $this->render('trick/index.html.twig', [
            'tricks' => $trickRepository->findAll(),
        ]);
    }

    #[Route('/newTrick', name: 'app_trick_new', methods: ['GET', 'POST'])]
    #[IsGranted(new Expression(
        '"ROLE_ADMIN" in role_names or (is_authenticated())'
    ))]
    public function new(Request $request, TrickRepository $repository, SluggerInterface $slugger, EntityManagerInterface $entityManager): Response
    {
        $trick = new Trick();
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $name = $repository->findByName($trick->getName());
            /** @var UploadedFile $brochureFile */
            $media = $form->get('media')->getData();
            $embed = $form->get('embed')->getData();
            if ($media) {
                foreach ($media as $mediaToAdd) {
                    try {

                        $originalFilename = pathinfo($mediaToAdd->getClientOriginalName(), PATHINFO_FILENAME);
                        // this is needed to safely include the file name as part of the URL
                        $safeFilename = $slugger->slug($originalFilename);
                        $newFilename = $safeFilename . '-' . uniqid() . '.' . $mediaToAdd->guessExtension();


                        $mediaToAdd->move(
                            $this->getParameter('medias_directory'),
                            $newFilename
                        );
                        $trickMedia = new Media();
                        $trickMedia->setUrl($newFilename);
                        $trick->addMedia($trickMedia);
                    } catch (FileException $e) {
                        // ... handle exception if something happens during file upload
                        echo ($e);
                    }
                }
            } elseif ($embed) {
                $trickMedia = new Media();
                $trickMedia->setEmbed($embed);
                $trick->addMedia($trickMedia);
            }

            if ($name !== null) {
                $this->addFlash(
                    'notice',
                    'Name already exist'
                );
                return $this->render('trick/new.html.twig', [
                    'trick' => $trick,
                    'form' => $form,
                ]);
            }

            $form = $form->getData();
            $slugger = new AsciiSlugger();
            $slug = $slugger->slug($form->getName());
            $trick->setSlug($slug);
            $slug = preg_replace('/\s+/', '_', $slug);

            $entityManager->persist($trick);
            $entityManager->flush();
            $this->addFlash(
                'success',
                'The trick ' . $trick->getName() . ' was successfully registered !'
            );
            return $this->redirectToRoute('app_trick_show', ['slug' => $slug], Response::HTTP_SEE_OTHER);
        }


        return $this->render('trick/new.html.twig', [
            'trick' => $trick,
            'form' => $form,
        ]);
    }

    #[Route('/show/{slug}', name: 'app_trick_show', methods: ['GET'])]
    // #[Route('/{id}/show', name: 'app_trick_show', methods: ['GET'])]
    public function show(Trick $trick, Request $request, EntityManagerInterface $entityManager, PaginatorInterface $paginator): Response
    {
        $trickMessage = new Message();
        $formMessage = $this->createForm(MessageType::class, $trickMessage);
        $formMessage->handleRequest($request);
        $images = [];
        $videos = [];
        $embed = [];
        $numberofComments = 2;
        $query = $entityManager->createQuery('SELECT m
            FROM App\Entity\Message m
            WHERE m.trick = :trick_id  ORDER BY m.created_at DESC')->setParameter('trick_id', $trick->getId());
        $pagination = $paginator->paginate(
            $query, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            $numberofComments /*limit per page*/
        );
        foreach ($trick->getMedias() as $media) {
            if ($media->getUrl() !== null) {
                try {
                    $mimeType = @mime_content_type($this->getParameter('medias_directory') . '/' . $media->getUrl());
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                    echo ($e);
                }
                if (in_array($mimeType, Media::getImagesTypes())) {
                    $images[] = $media;
                } elseif (in_array($mimeType, Media::getVideosTypes())) {
                    $videos[] = $media;
                }
            } elseif ($media->getEmbed() !== null) {
                $embed[] = $media;
            }
        }

        if ($formMessage->isSubmitted() && $formMessage->isValid()) {
            $trickMessage->setTrick($trick);
            $trickMessage->setUser($this->getUser());
            $entityManager->persist($trickMessage);
            $entityManager->flush();

            $this->addFlash(
                'success',
                'Well saved comment'
            );
        }

        return $this->render('trick/show.html.twig', [
            'trick' => $trick,
            'images' => $images,
            'videos' => $videos,
            'embed' => $embed,
            'formMessage' => $formMessage,
            'pagination' => $pagination,
        ]);
    }

    #[Route('/edit/{slug}', name: 'app_trick_edit', methods: ['GET', 'POST'])]
    #[IsGranted(new Expression(
        '"ROLE_ADMIN" in role_names or (is_authenticated())'
    ))]
    public function edit(Request $request, Trick $trick, EntityManagerInterface $entityManager, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $brochureFile */
            $media = $form->get('media')->getData();
            $embed = $form->get('embed')->getData();

            if ($media) {
                foreach ($media as $mediaToAdd) {
                    try {
                        $originalFilename = pathinfo($mediaToAdd->getClientOriginalName(), PATHINFO_FILENAME);
                        // this is needed to safely include the file name as part of the URL
                        $safeFilename = $slugger->slug($originalFilename);
                        $newFilename = $safeFilename . '-' . uniqid() . '.' . $mediaToAdd->guessExtension();


                        $mediaToAdd->move(
                            $this->getParameter('medias_directory'),
                            $newFilename
                        );
                        $trickMedia = new Media();
                        $trickMedia->setUrl($newFilename);
                        $trick->addMedia($trickMedia);
                    } catch (FileException $e) {
                        // ... handle exception if something happens during file upload
                        echo ($e);
                    }
                }
            } elseif ($embed) {
                $trickMedia = new Media();
                $trickMedia->setEmbed($embed);
                $trick->addMedia($trickMedia);
            }

            $form = $form->getData();
            $slugger = new AsciiSlugger();
            $slug = $slugger->slug($form->getName());
            $trick->setSlug($slug);
            $slug = preg_replace('/\s+/', '_', $slug);

            $entityManager->flush();

            return $this->redirectToRoute('app_trick_show', ['slug' => $trick->getSlug()], Response::HTTP_SEE_OTHER);
        }

        return $this->render('trick/edit.html.twig', [
            'trick' => $trick,
            'form' => $form,
            'slug' => $trick->getSlug(),
        ]);
    }

    #[Route('/trick/{slug}/delete', name: 'app_trick_delete', methods: ['DELETE'])]
    #[IsGranted(new Expression(
        '"ROLE_ADMIN" in role_names or (is_authenticated())'
    ))]
    public function delete(Request $request, Trick $trick, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete-trick', $request->request->get('_token'))) {

            $entityManager->remove($trick);
            $entityManager->flush();
        }

        return $this->redirectToRoute('home', [], Response::HTTP_SEE_OTHER);
    }
}
