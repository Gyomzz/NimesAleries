<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SearchController extends AbstractController
{
    /**
     * @Route("/handleSearch", name="handleSearch")
     * @param Request $request
     */
    public function handleSearch(Request $request, ProductRepository $repo)
    {
        $query = $_POST['search'];
        if($query) {
            $articles = $repo->findArticlesByName($query);
        }
        return $this->render('search/index.html.twig', [
            'articles' => $articles,
            'title' => 'resultat de votre recherche'
        ]);
    }
}
