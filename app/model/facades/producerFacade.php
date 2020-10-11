<?php

namespace App\Model\Facades;

use App\Model\Entities\producer;
use Kdyby\Doctrine\EntityManager;


class producerFacade
{
    private $em;

    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }

    public function getAllProducers()
    {
        $qb = $this->em->createQueryBuilder();
        $qb->select("c")
            ->from(producer::class, "c");

        $result = $qb->getQuery()->getResult();
        return $result;
    }

    public function getProducerById($id)
    {
        $qb = $this->em->createQueryBuilder();
        $qb->select("c")
            ->from(producer::class, "c")
            ->where("c.id = :id")
            ->setParameter("id", $id);

        $result = $qb->getQuery()->getResult();

        if(!is_null($result))
            return $result[0];
        else
            return null;
    }

}