<?php

namespace App\Controller;

use App\Entity\Carousel;
use App\Form\CarouselType;
use App\Repository\CarouselRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CarouselController extends AbstractController
{
    
    public function getCarouselOrder(){
        $carousel = $this->getDoctrine()
            ->getRepository(Carousel::class)
            ->findCarouselByOrders();
        $session = $this->requestStack->getSession();
        $session = $this->get('session');     
        $session->set('carousel', $carousel);

        if(!$carousel){
            throw $this->createNotFoundException(
                'No category found'
            );
        }
        return $carousel;
    }
    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }

}
