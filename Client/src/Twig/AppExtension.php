<?php

namespace App\Twig;

use Symfony\Component\HttpFoundation\RequestStack;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class AppExtension extends AbstractExtension
{
    private $requestStack;

    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }

    public function getFunctions()
    {
        return [
            new TwigFunction('activeMenu', [$this, 'activeMenu'])
        ];
    }



    /**
     * Pass route names. If one of route names matches current route, this function returns
     * 'active'
     * @param array $routesToCheck
     * @return string
     */
    public function activeMenu(array $routesToCheck)
    {
        $currentRoute = $this->requestStack->getCurrentRequest()->get('_route');

        foreach ($routesToCheck as $routeToCheck) {
            if ($routeToCheck == $currentRoute) {
                return 'active';
            }
        }

        return '';
    }
}