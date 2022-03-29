<h1 align="center">
  <img src="https://raw.githubusercontent.com/GalsenDev221/made.in.senegal/master/assets/made.in.senegal.png" width="100px" />
  <br/>
  <a href="https://madeinsenegal.dev/" target="blank_">Made In Senegal</a>
</h1>


<p align="center"><a href="https://symfony.com" target="_blank">
    <img src="https://symfony.com/logos/symfony_black_02.svg">
</a></p>

---
[Symfony]() is a **PHP framework** for web and console applications and a set
of reusable **PHP components**. Symfony is used by thousands of web
applications and most of the [popular PHP projects]().

[Demo Video](https://drive.google.com/file/d/1fqtB6iOwzIUA5TyAXfDzQa-h-e0CQ7c4/view?usp=sharing)
***
### Requirements to install 
* [Composer]() 
* [docker]() 
* [git]() 

Installation
------------
### Let's build our container base in our docker file
```Terminal```
```shell
docker-compose build
```

### Let's Run Our Containers
```shell
docker-compose up -d
```
or alternatively Run the following command if errors occurs 
```shell
docker-compose -f "docker-compose.yml" up -d --build
```



### Let's run our project directory in container
```Terminal```
```shell
docker exec -it  www_docker_symfony bash
cd project
```

***
Open project on browser http://localhost:8741
***
### We can Install dependency inside our new interactive terminal by running the following command
```Terminal```
```shell
composer install  
```
### Configure our database in .env file
It's already Configure but you can Configure your own
```Terminal```
```env
DATABASE_URL="mysql://root:@db_docker_symfony/db_kritek_test?serverVersion=5.7&charset=utf8mb4
```
### Create database using Doctrine
```Terminal```
```shell
php bin/console doctrine:database:create
```
### Run Migrations
```Terminal```
```shell
php bin/console doctrine:migrations:migrate
```
That's it !!!!💥💥💥
Enjoy it!!!!💥💥💥
