<?php

namespace App\Controller;

use App\Entity\Employe;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class EmployeController extends AbstractController
{
    /**
     * @Route("/employe", name="app_employe")
     */
    public function index(ManagerRegistry $doctrine): Response
    {
        $employes = $doctrine->getRepository(Employe::class) ->findBy([],["prenom"=>"ASC"]);
        
        return $this->render('employe/index.html.twig', [

            'employes'=>$employes

        ]);
    }

    
/**
     * @Route("/employe/{id}", name="details_employe")
     */
    public function detailesEmploye(Employe $employe){

        return $this->render('employe/details.html.twig', [

            'employe'=>$employe

        ]);


    }



    
}
