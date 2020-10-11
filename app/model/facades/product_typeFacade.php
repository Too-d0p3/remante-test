<?php

namespace App\Model\Facades;

use App\Model\Entities\product_type;
use Kdyby\Doctrine\EntityManager;

class product_typeFacade
{
    private $em;

    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }

    public function getAllProductTypes()
    {
        $qb = $this->em->createQueryBuilder();
        $qb->select("c")
            ->from(product_type::class, "c");

        $result = $qb->getQuery()->getResult();
        return $result;
    }

    public function getProductTypeById($id)
    {
        $qb = $this->em->createQueryBuilder();
        $qb->select("c")
            ->from(product_type::class, "c")
            ->where("c.id = :id")
            ->setParameter("id", $id);

        $result = $qb->getQuery()->getResult();

        if(!is_null($result))
            return $result[0];
        else
            return null;
    }

}