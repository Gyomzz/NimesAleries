<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductType;
use App\Repository\ProductRepository;
use App\Service\FileUploader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @IsGranted("ROLE_ADMIN")
 * @Route("/crud/product")
 */
class CrudProductController extends AbstractController
{
    /**
     * @Route("/", name="crud_product_index", methods={"GET"})
     */
    public function index(ProductRepository $productRepository): Response
    {
        return $this->render('crud_product/index.html.twig', [
            'products' => $productRepository->findProductOrdersByCat(),
            'title' => 'Gestion des produits',
        ]);
    }

    /**
     * @Route("/new", name="crud_product_new", methods={"GET","POST"})
     */
    public function new(Request $request, FileUploader $fileUploader): Response
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $brochureFile */
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                $pictureName = $fileUploader->upload($pictureFile);
                $product->setImage($pictureName);
            }
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($product);
            $entityManager->flush();

            return $this->redirectToRoute('crud_product_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('crud_product/new.html.twig', [
            'product' => $product,
            'form' => $form,
            'title' => 'Nouveau produit',
        ]);
    }

    /**
     * @Route("/{id}", name="crud_product_show", methods={"GET"})
     */
    public function show(Product $product): Response
    {
        return $this->render('crud_product/show.html.twig', [
            'product' => $product,
            'title' => 'Details du produit '. $product->getName(),
        ]);
    }

    /**
     * @Route("/{id}/edit", name="crud_product_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Product $product, FileUploader $fileUploader): Response
    {
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $brochureFile */
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                $pictureName = $fileUploader->upload($pictureFile);
                $product->setImage($pictureName);
            }
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('crud_product_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('crud_product/edit.html.twig', [
            'product' => $product,
            'form' => $form,
            'title' => 'Modification produit ' . $product->getName(),
        ]);
    }

    /**
     * @Route("/{id}", name="crud_product_delete", methods={"POST"})
     */
    public function delete(Request $request, Product $product): Response
    {
        if ($this->isCsrfTokenValid('delete'.$product->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($product);
            $entityManager->flush();
        }

        return $this->redirectToRoute('crud_product_index', [], Response::HTTP_SEE_OTHER);
    }
}
