<?php


namespace App\Model\Facades;


use App\Model\Entities\product;
use App\Model\Queries\productQuery;
use Kdyby\Doctrine\EntityManager;


class productFacade
{
    private $em;

    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }

    public function getProductById($id)
    {
        $qb = $this->em->createQueryBuilder();
        $qb->select("c", "p", "pt")
            ->from(product::class, "c")
            ->Join("c.producer", "p")
            ->Join("c.product_type", "pt")
            ->where("c.id = :id")
            ->setParameter("id", $id);

        $result = $qb->getQuery()->getResult();
        if(!empty($result))
            return $result[0];
        else
            return null;

    }

    public function getQBForAllProducts()
    {
        $qb = $this->em->createQueryBuilder();
        $qb->select("c", "p", "pt")
            ->from(product::class, "c")
            ->Join("c.producer", "p")
            ->Join("c.product_type", "pt");
        return $qb;
    }

    public function editProduct(Product $product, $data)
    {
        $product->code = $data->code;
        $product->product_type = $data->product_type;
        $product->producer = $data->producer;
        $product->price = $data->price;
        $product->description = $data->description;
        $this->em->flush();
    }
}