<?php

namespace App\Controller;

use App\Entity\Entreprise;
use App\Form\EntrepriseType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class EntrepriseController extends AbstractController
{
    /**
     * @Route("/entreprise", name="app_entreprise")
     */
    public function index(ManagerRegistry $doctrine): Response
    {   
        // get all entreprises in DB
        $entreprises = $doctrine->getRepository(Entreprise::class) ->findAll();
        
        return $this->render('entreprise/index.html.twig', [
            'entreprises'=>$entreprises
        
        ]);
    }

     /**
     * @Route("/entreprise/add", name="add_entreprise")
     */

     public function  add(ManagerRegistry $doctrine, Entreprise $entreprise = null , Request $request): Response
     {

        $form = $this->createForm(EntrepriseType::class, $entreprise);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){

            $entreprise = $form->getData(); 
            $entityManager = $doctrine->getManager();
            // prepare
            $entityManager->persist($entreprise);
            // insert into (execute)
            $entityManager->flush();

            return $this->redirectToRoute("app_entreprise");

        }
 
            // to show the form of add 
         return $this->render('entreprise/add.html.twig', [
             'formAddEntreprise'=> $form->createView()
         
         ]);
 
     }



      /**
     * @Route("/entreprise/{id}", name="details_entreprise")
     */

    public function  details_entreprise(Entreprise $entreprise): Response
    {

        return $this->render('entreprise/details.html.twig', [
            'entreprise'=>$entreprise
        
        ]);

    }


}
