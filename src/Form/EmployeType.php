<?php

namespace App\Form;

use App\Entity\Employe;
use Proxies\__CG__\App\Entity\Entreprise;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class EmployeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom',TextType::class)
            ->add('prenom',TextType::class)
            ->add('dateNaissance', DateType::class , [
                'widget'=>'single_text'
            ])
            ->add('dateEmbauche', DateType::class, [
                'widget'=>'single_text'
            ])
            ->add('ville',TextType::class)
            ->add('entreprise', EntityType::class,[
                'class' => Entreprise::class,
                'choice_label'=>'raisonSociale'
            ])
            ->add('submit',SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Employe::class,
        ]);
    }
}
