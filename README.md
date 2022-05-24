# Pizzeria Delapapa

A demo of the project is currently available [here](https://pizzeria-delapapa.herokuapp.com/). The database is hosted on a free-tier server, so it might be slow to navigate in the app.

## Software architecture

The website is using a monolithic architecture. Backend and frontend code are both in the same module. However you can find the frontend code in the `public` directory, witch is the static directory served by Express.

- Backend :
Frontend code is calling backend "components" (through `render` function). These components are templated with EJS (`views` directory), and data are dynamically added via some controllers (`controller` directory)
Each backend actions (such as getting all users, gettings all menus, ...) need to be implemented in this directory.
By the way, we can find the data models in the `model` directory. Since no ORM is used in the project, there's no guarantee that data model in the app, is the same as data model in the database. Therefore, we need to be carefull when creating/modifying/deleting data.
A `config` folder is also present where you can change database config (DB_USER, DB_HOST, ...) but these configurations can simply be changed with a `.env` file at the project root.
Additionally, a `queries` folder contains the SQL commands for each controllers. This is just about refactor/maintainment, so we can change a query easier than if it was inside a file and we needed to look for all occurences of this particular query.
Finally, we created an `utils` directory so we can use functions through all backend code.
- Frontend :
There's nothing hard with frontend architecture, appart from the router. We created our own router object (`router.js`). Given an array of routes, and a query selector of the HTML element to render the components, you can easily create a simple router by just creating a `new Router(["route1", "route2"], "#my_div")`. The rest is just some basic JQuery/HTML/CSS.

## Using the project

### Run in development
Since `nodemon` is a part of the dependencies, you can run the project in development mode with 
```
npm start
```

### Deploy the project
Project is using express, so you just need to deploy it on an appropriate platform (Heroku, ...). 

## Setup the database
In order to setup the database, from your project folder, you'll have to use the command 
```
psql -d postgres <USERNAME>
``` 
where **\<USERNAME\>** needs to be replaced with a root privileges user on your database (you may leave it empty if you have a default installation since `postgres` should be the default user)
After this, type in psql command prompt :
```
\i init.sql
```