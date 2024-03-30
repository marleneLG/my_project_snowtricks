# Project 6 : Snowtricks

This project was created as part of my training with openclassrooms to present you my skills obtained through my learning.

## Technologies

- Symfony 6.4.1
- Composer 2.2.6
- Bootstrap 5.4
- WampServer
  - Apache 2.4.54
  - PHP 8.2.0
  - MySQL 8.0.31

## Getting started

In order to install the project, follow these simple steps.

### Prerequisite

- PHP > 8.2.0
- Symfony
- SMTP server WAMP/MAMP for local use
- MySQL 8.0.31
- Librarie will be installed using Composer [Twig](https://twig.symfony.com/doc/1.x/installation.html)
- CSS libraries [Bootstrap](https://getbootstrap.com/)
- Mailing service with docker

## Installation

### Clone

- Clone the project with this command: 
    `https://github.com/marleneLG/my_project_snowtricks.git`
- For more information: [GitHub Documentation](https://docs.github.com/fr/repositories/creating-and-managing-repositories/cloning-a-repository)

### Configuration

- Perform the "composer install" command in order to install the necessary back dependencies: 
    `composer install`
- Configure environment variables such as database connection, emails in file `.env` :
    `DATABASE_URL="mysql://root:@127.0.0.1:3306/my_project_snowtricks"`
    `MAILER_DSN=smtp://localhost:1025`
- Create database: 
    `php bin/console doctrine:database:create`
- Apply migration:
  `php bin/console doctrine:migrations:migrate`
- Start the project:
    `php bin/console server:start`
