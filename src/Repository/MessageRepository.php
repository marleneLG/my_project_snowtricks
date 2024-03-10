<?php

// src/Repository/ProductRepository.php
namespace App\Repository;

use App\Entity\Message;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class MessageRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Message::class);
    }

    public function paginationQuery(): ?object
    {
        return $this->createQueryBuilder('m')
            ->orderBy('m.created_at', 'DESC')
            ->getQuery();
    }
}
