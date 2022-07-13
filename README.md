
# WAFO

An application for rescuing foods which potentially become wastes

## Introduction

According to a study from the National Development Planning Agency (Bappenas), Indonesia
produced 23-48 million tons of food waste per year in the period of 2000 until 2019, equivalent
to 115 to 184 kilograms per capita per year. The source of this type of wastes mostly came from households
and restaurants. This occurs due to overproduction of meals, overbuying, and
spoilage, which is thrown away before being eaten. It was found that the second-highest city of
food waste disposal with the most active internet users in Indonesia is Jabodetabek. 

Therefore, WAFO comes as a part of contribution in order to solve the food waste problems.
This application aims to achieve food waste reduction  by 5% at restaurants in Indonesia, specifically in
Jabodetabek as a contribution to the national target of waste reduction by the government
within 3 years.

## Product Description

This application helps sell food products that have the potential to be wasted (overproduction
or under-selling) from each partner which is of course still safe to eat. Customers also benefit by
getting cheaper food prices. To ensure that the food product is still safe to eat, besides a price
tag, each food also will be labeled the time when the food is cooked and when the food
expires.

Customers can choose the desired food from the available merchants. After choosing the food, 
the customers make payment directly on the spot while picking up the food at the restaurant 
where they ordered.

In addition to helping food business owners from reduced income due to wasted food products
that are not selling well, this application also helps reduce the amount of food that is wasted
due to too much production or not selling, which only increases the amount of food waste.

## Features of the application

* User can choose a role (Admin, Merchant, Customer)
* Customer can see all available items (food/beverage) in the market
* Customer can find the desired item by category
* Customer can browse the desired item and merchant by input the name
* Customer can add an item to the cart
* Customer can edit item from cart
* Customer can remove an item from cart
* Customer can adjust the quantity of orders for each item
* Customer can select which merchant they want to create the payment
* Customer can find Merchant location in map
* Customer can update their email and password
* Merchant can sell items (food/beverage) to the market
* Merchant can see all the items they sell
* Merchant can see the list of ordered items
* Merchant can adjust the number of stocks they sell for each item
* Merchant can delete items that are out of stock

## Tech Stack

* Programming Language: Ruby
* Framework: Ruby on Rails
* Database: PostgreSQL, Redis
* Unit Testing: RSpec
* API Testing: Postman
* API Docs: Postman
* Container: Docker
* Deployment: Heroku
* Code Editor: Visual Studio Code


## Installation

### Program Installation
The programming language used to run the project is Ruby on Rails on Windows 10 version 7.0.3 with PostgreSQL as the database. The step of installation of Ruby on Rails and setting up PostgreSQL on windows can be seen at [gorails.com](https://gorails.com/setup/windows/10).

### Github Repository
Clone this github repo:
```
git clone https://github.com/madjiebimaa/wafo
```
Install all required bundle:
```
bundle install
```
Run the create database:
```
rails db:create
```
Run the migration:
```
rails db:migrate
```
Run the insert initial data to the database:
```
rails db:seed
```
Run the server:
``` 
rails s
```

## Usage
This application provides some instructions to access the features for each roles; admin, customer, and merchant. User may refer to the [API documentation](https://documenter.getpostman.com/view/21640459/UzJETzNp) of this application for the detail features.

### Entity Relationship Diagram
![wafo erd](https://user-images.githubusercontent.com/106664987/178392358-78c82349-b35d-406c-b95a-5868e70c1b3c.png)

## Project Logo
![logo wafo](https://user-images.githubusercontent.com/106664987/176475530-0538d94a-65dc-4bc9-a6dd-f98fe39997bc.jpeg)

## Project Status
This project still in progress by the WAFO team. Some features may be available once the team has finish creating the program.



