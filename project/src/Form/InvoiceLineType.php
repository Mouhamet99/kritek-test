<?php

namespace App\Form;

use App\Entity\InvoiceLine;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class InvoiceLineType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('description', TextType::class,['label'=>false,'attr' => ['class' => 'd-inline-block w-75']])
            ->add('quantity', IntegerType::class,['label'=>false,'attr' => ['class' => 'd-inline-block w-75']])
            ->add('amount', MoneyType::class,['label'=>false,'attr' => ['class' => 'd-inline-block w-75']])
            ->add('vat_amount', MoneyType::class,['label'=>false,'attr' => ['class' => 'd-inline-block w-75']])
            ->add('total_with_vat', MoneyType::class,['label'=>false,'attr' => ['class' => 'd-inline-block w-75']]);
        
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => InvoiceLine::class,
        ]);
    }
}
