<?php

namespace App\Entity;

use App\Repository\InvoiceLineRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: InvoiceLineRepository::class)]
class InvoiceLine
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'text', nullable: false)]
    #[Assert\NotBlank]
    private $description;

    #[ORM\Column(type: 'integer')]
    #[Assert\NotNull]
    #[Assert\PositiveOrZero]
    private $quantity;
    
    #[ORM\Column(type: 'decimal', precision: 3, scale: 1)]
    #[Assert\Regex("/^[0-9]{1,2}(\.[0-9])?$/", "Amount must be a valid decimal number ")]
    private $amount;

    #[ORM\Column(type: 'decimal', precision: 3, scale: 1)]
    #[Assert\Regex("/^[0-9]{1,2}(\.[0-9])?$/", "Amount must be a valid decimal number ")]
    private $vat_amount;

    #[ORM\Column(type: 'decimal', precision: 3, scale: 1)]
    #[Assert\Regex("/^[0-9]{1,2}(\.[0-9])?$/", "Amount must be a valid decimal number ")]

    private $total_with_vat;

    #[ORM\ManyToOne(targetEntity: Invoice::class, inversedBy: 'invoiceLines')]
    #[ORM\JoinColumn(nullable: false)]
    private $invoice;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): self
    {
        $this->quantity = $quantity;

        return $this;
    }

    public function getAmount(): ?string
    {
        return $this->amount;
    }

    public function setAmount(string $amount): self
    {
        $this->amount = $amount;

        return $this;
    }

    public function getVatAmount(): ?string
    {
        return $this->vat_amount;
    }

    public function setVatAmount(string $vat_amount): self
    {
        $this->vat_amount = $vat_amount;

        return $this;
    }

    public function getTotalWithVat(): ?string
    {
        return $this->total_with_vat;
    }

    public function setTotalWithVat(string $total_with_vat): self
    {
        $this->total_with_vat = $total_with_vat;

        return $this;
    }

    public function getInvoice(): ?Invoice
    {
        return $this->invoice;
    }

    public function setInvoice(?Invoice $invoice): self
    {
        $this->invoice = $invoice;

        return $this;
    }

    public function addInvoice(Invoice $invoice): void
    {
        if (!$invoice->invoiceLines->contains($this)) {
            $this->setInvoice($invoice);
        }
    }
 
}
