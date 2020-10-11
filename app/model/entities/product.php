<?php

namespace App\Model\Entities;

use Doctrine\ORM\Mapping as ORM;
use Kdyby\Doctrine\Entities\BaseEntity;

/**
 * @package App\Model\Entities
 * @ORM\Entity
 */
class product extends BaseEntity
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue
     */
    protected $id;

    /**
     * @ORM\ManyToOne(targetEntity="product_type", inversedBy="products")
     * @ORM\JoinColumn(name="product_type", referencedColumnName="id")
     */
    protected $product_type;

    /**
     * @ORM\ManyToOne(targetEntity="producer", inversedBy="products")
     * @ORM\JoinColumn(name="producer", referencedColumnName="id")
     */
    protected $producer;

    /**
     * @ORM\Column(type="integer")
     */
    protected $price;

    /**
     * @ORM\Column(type="text")
     */
    protected $description;

    /**
     * @ORM\Column(type="string")
     */
    protected $code;
}