<?php

namespace App\DataFixtures;

use App\Entity\Customer;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class CustomerFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create("fr-FR");
        // create 10 customers
        for ($i = 0; $i < 10; $i++) {
            $customer = new Customer();
            $customer->setName($faker->unique()->name());
            $customer->setEmail($faker->unique()->email);
            $manager->persist($customer);
        }

        $manager->flush();
    }
}
