<?php

namespace App\Entity;

use App\Repository\OrdersProductRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=OrdersProductRepository::class)
 */
class OrdersProduct
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToMany(targetEntity=Product::class)
     */
    private $Id_product;

    /**
     * @ORM\ManyToOne(targetEntity=Orders::class, inversedBy="ordersProducts")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Id_order;

    public function __construct()
    {
        $this->Id_product = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return Collection|Product[]
     */
    public function getIdProduct(): Collection
    {
        return $this->Id_product;
    }

    public function addIdProduct(Product $idProduct): self
    {
        if (!$this->Id_product->contains($idProduct)) {
            $this->Id_product[] = $idProduct;
        }

        return $this;
    }

    public function removeIdProduct(Product $idProduct): self
    {
        $this->Id_product->removeElement($idProduct);

        return $this;
    }

    public function getIdOrder(): ?Orders
    {
        return $this->Id_order;
    }

    public function setIdOrder(?Orders $Id_order): self
    {
        $this->Id_order = $Id_order;

        return $this;
    }
}
