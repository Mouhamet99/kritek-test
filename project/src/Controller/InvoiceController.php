<?php

namespace App\Controller;

use App\Entity\Invoice;
use App\Entity\InvoiceLine;
use App\Form\InvoiceType;
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
    public function new(Request $request): Response
    {
        $invoice = new Invoice();
        // dummy code - add some example tags to the task
        // (otherwise, the template will render an empty list of tags)
        // $tag1 = new Tag();
        // $tag1->setName('tag1');
        // $task->getTags()->add($tag1);
        // $tag2 = new Tag();
        // $tag2->setName('tag2');
        // $task->getTags()->add($tag2);
        // end dummy code

        $form = $this->createForm(InvoiceType::class, $invoice);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
                dd($request);
        }

        return $this->renderForm('invoice/new.html.twig', [
            'form' => $form
        ]);
    }
}
