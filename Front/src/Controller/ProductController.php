<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\OrdersProduct;
use App\Entity\Product;
use App\Repository\CategoryRepository;
use App\Repository\OrdersProductRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
* @Route("/produits")
*/
class ProductController extends AbstractController
{
   
     /**
     * @Route("/", name="produits")
     */
    public function index(ProductRepository $productRepository): Response
    {
        return $this->render('product/index.html.twig', [
            'title' => 'Liste des produits',
            'products' => $productRepository->findAll(),
            'category' => false,
            'categoryRepo' =>  $this->getDoctrine()->getManager()->getRepository(Category::class)
        ]);
    } 

    /**
     * @Route("/{category}", name="produits_category")
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
     * @param string $category
     * @param string $name
     * @Route("/{category}/{name}", name="produit_show")
     */
    public function show(Product $product): Response
    {
        return $this->render('product/show.html.twig', [
            'product' => $product,
            'title' => 'Details du produit',
        ]);
    }
}
