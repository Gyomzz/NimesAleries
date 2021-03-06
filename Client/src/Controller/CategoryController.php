<?php

namespace App\Controller;

use App\Entity\Category;
use App\Manager\CartManager;
use App\Repository\OrderItemRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class CategoryController extends AbstractController
{
   
    public function index(CartManager $cartManager, ProductRepository $productRepository, OrderItemRepository $orderItemRepository): Response
    {
        $cart = $cartManager->getCurrentCart();
        $session = $this->requestStack->getSession();
        $session = $this->get('session');        
        $session->set('cart', $cart);
        return $this->render('base.html.twig', [
            'title' => 'NimesAleries | home',
            'carousel' => $this->forward('App\Controller\CarouselController:getCarouselOrder'),
            'category' => $this->getCategory(),
            'featured_Product' => $productRepository->findProductWithImage(),
            'trending_product' => $orderItemRepository->findBestProduct()
        ]);
    }
    

    public function getCategory(){
        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findCategory();
        $session = $this->requestStack->getSession();
        $session = $this->get('session');        
        $session->set('categories', $categories);

        if(!$categories){
            throw $this->createNotFoundException(
                'No category found'
            );
        }
        return $categories;
    }
    private $requestStack;

    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }
}
