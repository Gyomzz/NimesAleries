<?php

namespace App\Controller;

use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/home", name="home")
     */
    public function index(): Response
    {
        return $this->render('base.html.twig', [
            'title' => 'NimesAleries | home',
            'category' => $this->forward('App\Controller\CategoryController:getCategory'),
            'carousel' => $this->forward('App\Controller\CrudCarouselController:getCarouselOrder'),
            'repo' => $this->forward('App\Controller\CategoryController:getRepo'),
        ]);
    }
}
