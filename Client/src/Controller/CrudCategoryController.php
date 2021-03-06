<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Form\FormInterface;

/**
 * @IsGranted("ROLE_ADMIN")
 * @Route("/crud/category")
 */
class CrudCategoryController extends AbstractController
{
    /**
     * @Route("/", name="crud_category_index", methods={"GET"})
     */
    public function index(CategoryRepository $categoryRepository): Response
    {
        return $this->render('crud_category/index.html.twig', [
            'categories' => $categoryRepository->findAll(),
            'title' => 'Gestion des catégories',
        ]);
    }

    /**
     * @Route("/new", name="crud_category_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $category = new Category();
        $form = $this->createForm(CategoryType::class, $category);
        $form['id_parent'] = $form->get('id_parent');
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($category);
            $entityManager->flush();

            return $this->redirectToRoute('crud_category_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('crud_category/new.html.twig', [
            'category' => $category,
            'form' => $form,
            'title' => 'Ajouter une nouvelle catégorie',
        ]);
    }

    /**
     * @Route("/{id}", name="crud_category_show", methods={"GET"})
     */
    public function show(Category $category): Response
    {
        return $this->render('crud_category/show.html.twig', [
            'category' => $category,
            'title' => 'Details de la catégorie',
        ]);
    }

    /**
     * @Route("/{id}/edit", name="crud_category_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Category $category): Response
    {
        $form = $this->createForm(CategoryType::class, $category);
        $form['id_parent'] = $form->get('id_parent');
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('crud_category_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('crud_category/edit.html.twig', [
            'category' => $category,
            'form' => $form,
            'title' => 'Modifier une catégorie',
        ]);
    }

    /**
     * @Route("/{id}", name="crud_category_delete", methods={"POST"})
     */
    public function delete(Request $request, Category $category): Response
    {
        if ($this->isCsrfTokenValid('delete'.$category->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($category);
            $entityManager->flush();
        }

        return $this->redirectToRoute('crud_category_index', [], Response::HTTP_SEE_OTHER);
    }
}
