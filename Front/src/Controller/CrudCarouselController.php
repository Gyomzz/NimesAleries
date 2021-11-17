<?php

namespace App\Controller;

use App\Entity\Carousel;
use App\Form\CarouselType;
use App\Repository\CarouselRepository;
use App\Service\FileUploader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\RequestStack;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @IsGranted("ROLE_ADMIN")
 * @Route("/crud/carousel")
 */
class CrudCarouselController extends AbstractController
{
    /**
     * @Route("/", name="crud_carousel_index", methods={"GET"})
     */
    public function index(CarouselRepository $carouselRepository): Response
    {
        return $this->render('crud_carousel/index.html.twig', [
            'carousels' => $carouselRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="crud_carousel_new", methods={"GET","POST"})
     */
    public function new(Request $request, FileUploader $fileUploader): Response
    {
        $carousel = new Carousel();
        $form = $this->createForm(CarouselType::class, $carousel);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $brochureFile */
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                $pictureName = $fileUploader->upload($pictureFile);
                $carousel->setImage($pictureName);
            }
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($carousel);
            $entityManager->flush();

            return $this->redirectToRoute('crud_carousel_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('crud_carousel/new.html.twig', [
            'carousel' => $carousel,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="crud_carousel_show", methods={"GET"})
     */
    public function show(Carousel $carousel): Response
    {
        return $this->render('crud_carousel/show.html.twig', [
            'carousel' => $carousel,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="crud_carousel_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Carousel $carousel, FileUploader $fileUploader): Response
    {
        $form = $this->createForm(CarouselType::class, $carousel);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $brochureFile */
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                $pictureName = $fileUploader->upload($pictureFile);
                $carousel->setImage($pictureName);
            }
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('crud_carousel_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('crud_carousel/edit.html.twig', [
            'carousel' => $carousel,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="crud_carousel_delete", methods={"POST"})
     */
    public function delete(Request $request, Carousel $carousel): Response
    {
        if ($this->isCsrfTokenValid('delete'.$carousel->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($carousel);
            $entityManager->flush();
        }

        return $this->redirectToRoute('crud_carousel_index', [], Response::HTTP_SEE_OTHER);
    }
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
        // return $carousel;
    }
    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }
}
