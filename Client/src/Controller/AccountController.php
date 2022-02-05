<?php

namespace App\Controller;

use App\Repository\OrderItemRepository;
use App\Repository\OrderRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountController extends AbstractController
{
    /**
     * @Route("/compte", name="account")
     */
    public function index(): Response
    {
        return $this->render('account/index.html.twig', [
            'controller_name' => 'AccountController',
            'title' => 'Mon compte'
        ]);
    }
    
    /**
     * @Route("/compte/facture/{factureId}", name="detail_facture")
     */
    public function detailFacture($factureId, OrderRepository $orderRepository, 
        OrderItemRepository $orderItemRepository): Response {

        $facture = $orderRepository->find($factureId);
        $produits = $orderItemRepository->findBy(['orderRef' => $factureId]);
        $total = 0;
        foreach($produits as $produit) {
            $total += $produit->getProduct()->getPrice() * $produit->getQuantity();
        }

        return $this->render('account/detailFacture.html.twig', [
            'title' => 'Détails de la facture numéro:',
            'facture' => $facture,
            'produits' => $produits,
            'total' => $total
        ]);
    }
}
