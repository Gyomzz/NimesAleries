<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\OrdersProduct;
use App\Entity\Product;
use App\Form\AddToCartType;
use App\Manager\CartManager;
use App\Repository\CategoryRepository;
use App\Repository\OrdersProductRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class ProductController extends AbstractController
{
   
     /**
     * @Route("/produits", name="produits")
     */
    public function index(CategoryRepository $categoryRepository): Response
    {
        return $this->render('product/index.html.twig', [
            'title' => 'Liste des produits',
            'category' => false,
            'categoryRepo' => $categoryRepository
        ]);
    } 
     /**
     * @param string $name
     * @Route("/produit/{name}", name="produit_display")
     */
    public function display(Product $product, CartManager $cartManager, Request $request): Response
    {
        $form = $this->createForm(AddToCartType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $item = $form->getData();
            $item->setProduct($product);

            $cart = $cartManager->getCurrentCart();
            $cart
                ->addItem($item)
                ->setUpdatedAt(new \DateTime());

            $cartManager->save($cart);
        }
        return $this->render('product/show.html.twig', [
            'product' => $product,
            'title' => 'Details du produit',
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/produits/{category}", name="produits_category")
     */
    public function category(CategoryRepository $categoryRepository, $category): Response
    {
        return $this->render('product/index.html.twig', [
            'title' => 'Liste des produits',
            'category' => $categoryRepository->findBy(array('name' => $category)),
            'categoryRepo' =>  $this->getDoctrine()->getManager()->getRepository(Category::class)
        ]);
    }
    /**
     * @Route("/produits/{category}/{child}", name="produits_category_child")
     */
    public function childCategory(CategoryRepository $categoryRepository, $child): Response
    {
        return $this->render('product/index.html.twig', [
            'title' => 'Liste des produits',
            'category' => $categoryRepository->findBy(array('name' => $child)),
            'categoryRepo' =>  $this->getDoctrine()->getManager()->getRepository(Category::class)
        ]);
    }
    /**
     * @param string $category
     * @param string $child
     * @param string $name
     * @Route("/produits/{category}/{child}/{name}", name="produit_show")
     */
    public function show(Product $product, CartManager $cartManager, Request $request): Response
    {
        $form = $this->createForm(AddToCartType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $item = $form->getData();
            $item->setProduct($product);

            $cart = $cartManager->getCurrentCart();
            $cart
                ->addItem($item)
                ->setUpdatedAt(new \DateTime());

            $cartManager->save($cart);
            $session = $this->requestStack->getSession();
            $session = $this->get('session');        
            $session->set('cart', $cart);
        }
        return $this->render('product/show.html.twig', [
            'product' => $product,
            'title' => 'Details du produit',
            'form' => $form->createView()
        ]);
    }

    private $requestStack;

    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }
   
}
