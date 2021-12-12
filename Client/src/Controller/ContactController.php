<?php

namespace App\Controller;

use App\Form\ContactFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Mailjet\Resources;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="contact")
     */
    public function index(Request $request)
    {
    $form = $this->createForm(ContactFormType::class);
    $form->handleRequest($request);
    if($form->isSubmitted() && $form->isValid()){
        $contactFormData = $form->getData();
        $mj = new \Mailjet\Client($_ENV['mailJetKeyPublic'], $_ENV['mailJetKeyPrivate'],true,['version' => 'v3.1']);
        $body = [
            'Messages' => [
            [
                'From' => [ 
                'Email' => $_ENV['mailJetMail'],
                'Name' =>  $contactFormData['email']
                ],
                'To' => [
                [
                    'Email' => $_ENV['mailJetMail'],
                    'Name' => 'NimesAleriesContact'
                ]
                ],
                'Subject' =>  $contactFormData['sujets'],
                'TextPart' => $contactFormData['email']. ' ' .$contactFormData['message']. ' '. $contactFormData['nom']. ' ' .$contactFormData['telephone'],
                'HTMLPart' => '<h1>'.$contactFormData['sujets'].'</h1><h2> Nom du client: '.$contactFormData['nom'] .' | email: '. $contactFormData['email'].'</h2><p> Numéro de téléphone: '. $contactFormData['telephone'].'<br></p><p>'. $contactFormData['message'],
                'CustomID' => "AppGettingStartedTest"
            ]
            ]
        ];

        $response = $mj->post(Resources::$Email, ['body' => $body]);
        $response->success() && var_dump($response->getData()); 
        return $this->redirectToRoute('index');
    }
    return $this->render('contact/index.html.twig', [
        'title' => 'Contact',
        'form' => $form->createView(),
    ]);
    }

}
