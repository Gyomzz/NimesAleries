<?php

namespace App\Controller;

use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/category", name="app_category")
 */
class CategoryController extends AbstractController
{
    /**
     * @Route("/", name="category_index")
     */
    public function index(): Response
    {
        $this->forward('App\Controller\CrudCarouselController:getCarouselOrder');
        $this->getCategory();
        return $this->render('base.html.twig', [
            'title' => 'NimesAleries | home',
        ]);
    }

    /**
     * @Route("/all", name="all_category")
     */
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
        // return $categories;
    }
    private $requestStack;

    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }
}
