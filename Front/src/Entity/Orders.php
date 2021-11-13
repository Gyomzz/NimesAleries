<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=OrdersRepository::class)
 */
class Orders
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     */
    private $status;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     */
    private $payment_method;

    /**
     * @ORM\Column(type="datetime_immutable", nullable=true)
     */
    private $created_at;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $delivery_address;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $invoice;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $validity_date;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="orders")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Id_user;

    /**
     * @ORM\OneToMany(targetEntity=OrdersProduct::class, mappedBy="Id_order")
     */
    private $ordersProducts;


    public function __construct()
    {
        $this->ordersProducts = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getPaymentMethod(): ?string
    {
        return $this->payment_method;
    }

    public function setPaymentMethod(?string $payment_method): self
    {
        $this->payment_method = $payment_method;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(?\DateTimeImmutable $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getDeliveryAddress(): ?string
    {
        return $this->delivery_address;
    }

    public function setDeliveryAddress(?string $delivery_address): self
    {
        $this->delivery_address = $delivery_address;

        return $this;
    }

    public function getInvoice(): ?string
    {
        return $this->invoice;
    }

    public function setInvoice(?string $invoice): self
    {
        $this->invoice = $invoice;

        return $this;
    }

    public function getValidityDate(): ?\DateTimeInterface
    {
        return $this->validity_date;
    }

    public function setValidityDate(?\DateTimeInterface $validity_date): self
    {
        $this->validity_date = $validity_date;

        return $this;
    }

    public function getIdUser(): ?User
    {
        return $this->Id_user;
    }

    public function setIdUser(?User $Id_user): self
    {
        $this->Id_user = $Id_user;

        return $this;
    }

    /**
     * @return Collection|OrdersProduct[]
     */
    public function getOrdersProducts(): Collection
    {
        return $this->ordersProducts;
    }

    public function addOrdersProduct(OrdersProduct $ordersProduct): self
    {
        if (!$this->ordersProducts->contains($ordersProduct)) {
            $this->ordersProducts[] = $ordersProduct;
            $ordersProduct->setIdOrder($this);
        }

        return $this;
    }

    public function removeOrdersProduct(OrdersProduct $ordersProduct): self
    {
        if ($this->ordersProducts->removeElement($ordersProduct)) {
            // set the owning side to null (unless already changed)
            if ($ordersProduct->getIdOrder() === $this) {
                $ordersProduct->setIdOrder(null);
            }
        }

        return $this;
    }

}
