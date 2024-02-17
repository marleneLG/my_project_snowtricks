<?php

namespace App\Controller;

use App\Entity\Media;
use App\Entity\Trick;
use App\Form\TrickType;
use App\Repository\TrickRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
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
                        dump($e);
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

            $entityManager->persist($trick);
            $entityManager->flush();
            $this->addFlash(
                'success',
                'The trick ' . $trick->getName() . ' was successfully registered !'
            );
            return $this->redirectToRoute('app_trick_show', ['id' => $trick->getId()], Response::HTTP_SEE_OTHER);
        }


        return $this->render('trick/new.html.twig', [
            'trick' => $trick,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_trick_show', methods: ['GET'])]
    public function show(Trick $trick): Response
    {
        return $this->render('trick/show.html.twig', [
            'trick' => $trick,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_trick_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Trick $trick, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_trick_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('trick/edit.html.twig', [
            'trick' => $trick,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_trick_delete', methods: ['POST'])]
    public function delete(Request $request, Trick $trick, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $trick->getId(), $request->request->get('_token'))) {
            $entityManager->remove($trick);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_trick_index', [], Response::HTTP_SEE_OTHER);
    }
}
