<?php

namespace App\Controller;

use App\Entity\Entreprise;

use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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
}
