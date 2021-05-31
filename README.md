
<h1 align="center">Coffee Shop Backend</h1>

Built with NodeJs using the <a href="https://en.wikipedia.org/wiki/Express.js">Express.Js</a> Framework.


Express.js is a web application framework for Node.js.</p> 


## Contents

  

-  [Description](#description)

-  [Requirements](#requirements)

-  [Installation](#installation)

-  [Endpoint](#endpoint)

-  [Documentation](#documentation)

  

## Description

  

This is RESTful api design for

[`Coffee Shop frontend`](https://github.com/abdipriyangga/b22-html-slicing).

Built with Node js, using ExpressJs framework and other libraries.

  

## Requirements

  

-  [`Node Js`](https://nodejs.org/en/)

-  [`npm`](https://www.npmjs.com/get-npm)

-  [`ExpressJs`](https://expressjs.com/)

-  [`Postman`](https://www.postman.com/downloads/)

-  [`MYSQL`](https://www.mysql.com/)

  

## Installation

  

1. Open your terminal or command prompt

2. Type `git clone https://github.com/abdipriyangga/b22-backend-beginner.git`

3. Open the folder and type `yarn install` or `npm install` for install dependencies

4. Create new database at **[MYSQL](https://www.mysql.com/)**

5. Type `npm run server` or `npm start` in terminal for run this backend, and this project running on port `localhost:8081`.



  

## Endpoint
 

### ITEMS

**Used for CRUD ITEMS**

| No. | Method | Endpoint                     | Information                      |
| --- | ------ | ---------------------------- | -------------------------------- |
| 1.  | POST   | /items                       | Used for add new item.           |
| 2.  | GET    | /items                       | Used for all items.              |
| 3.  |        | /items/:id                   | Used for detail item by id.      |
| 4.  |        | /items/search                | Used for search and sort item.   |
| 6.  | PATCH  | /items/:id                   | Used for set item by id.         |
| 7.  | DELETE | /items/:id                   | Used for delete item.            |
  

## Documentation

For more documentation , check it out below!

<a  href="https://documenter.getpostman.com/view/13532274/TzXzEcpE">

<img  src="https://img.shields.io/badge/Documentation-POSTMAN-blue.svg?style=popout&logo=postman"/>

</a>


