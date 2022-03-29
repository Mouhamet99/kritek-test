<?php

namespace App\Controller;

use App\Entity\Invoice;
use App\Entity\InvoiceLine;
use App\Form\InvoiceType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class InvoiceController extends AbstractController
{
    #[Route('/invoice', name: 'app_invoice')]
    public function index(): Response
    {
        return $this->render('invoice/index.html.twig', [
            'controller_name' => 'InvoiceController',
        ]);
    }
    
    #[Route('/invoice/new', name: 'new_invoice')]
    public function new(Request $request, ManagerRegistry $doctrine): Response
    {
        $invoice = new Invoice();

        $em = $doctrine->getManager();

        $form = $this->createForm(InvoiceType::class, $invoice);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $invoice = $form->getData();
            
            $em->persist($invoice);
            $em->flush();

            return $this->redirectToRoute('app_invoice');


        }

        return $this->renderForm('invoice/new.html.twig', [
            'form' => $form
        ]);
    }
}
