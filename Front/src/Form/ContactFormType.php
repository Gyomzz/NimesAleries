<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('nom',TextType::class, [
            'label' => false,
        ])
        ->add('sujets',TextType::class, [
            'label' => false,
        ])
        ->add('telephone',TextType::class, [
            'label' => false,
        ])
        ->add('email',EmailType::class, [
            'label' => false,
        ])
        ->add('message', TextareaType::class, [
            'attr' => ['rows' => 6],
            'label' => false,
        ])
        ->add('save', SubmitType::class, [
            'label' => 'Envoyer votre message'
        ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
