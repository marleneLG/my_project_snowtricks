<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Trick;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TrickType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('description', TextareaType::class)
            ->add('category', EntityType::class, [
                'class' => Category::class,
                'placeholder' => 'Choose an option',
                'choice_label' => 'name'
            ])
            ->add('embed', TextType::class, [
                'required' => false,
                'mapped' => false,
            ])
            ->add('media', FileType::class, [
                'label' => 'Media ',
                'multiple' => true,
                // unmapped means that this field is not associated to any entity property
                'mapped' => false,

                // make it optional so you don't have to re-upload the PDF file
                // every time you edit the Product details
                'required' => false,

                // unmapped fields can't define their validation using attributes
                // in the associated entity, so you can use the PHP constraint classes
                // 'constraints' => [
                //     new File([
                //         'mimeTypes' => array_merge(Media::getImagesTypes(), Media::getVideosTypes()),
                //         'mimeTypesMessage' => 'Please upload a valid document',
                //     ])
                // ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Trick::class,
        ]);
    }
}
