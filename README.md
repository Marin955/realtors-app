# README

## Description
Basic web app that shows realtors in a paginated table.
Using Rails 7 with Hotwire and Turbo, TailwindCSS and PostgreSQL

## Assumptions
* Realtors don't need to be loaded directly from a CSV file. Seeding them in PG table instead.

* A realtor is considered a duplicate if `First name`, `Last name` and `Brokerage` are the same.

## How to run it

This project assumes you have the following installed:

* Ruby 3.3.0
* Rails 7.1.3
* PostgreSQL 16

Also the postgres client should have a role that matches your local machine username. For example on my machine the app will try to connect to 'marinbilic' role. Default postgres installations come with these pre-added so should be fine.

Install all dependencies:
```
bundle install
```

Create the database and migrate:
```
rails db:create db:migrate
```

Run the seed script that loads rows from a CSV file and adds them to the DB:
```
rails db:seed
```

Run the server with:
```
rails s
```

Visit localhost:3000 to see the app.
