# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

```cassandraql
rvm install ruby-2.6.3
```

* System dependencies
````cassandraql
- Install PostgreSQL

- Insall Nodejs version above 9.0
````

* Database creation

```cassandraql
rake db:create
```

* Database initialization

```cassandraql
rake db:migrate
```

* Deployment instructions:

Install Yarn:

https://classic.yarnpkg.com/en/docs/install/#debian-stable

Upgrade Yarn:

```cassandraql
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```

Install Packages:

```cassandraql
bundle install

rails webpacker:install

rails s -p 3005
```

* Test Cases:

```cassandraql

RAILS_ENV=test rake db:environment:set db:drop db:create db:migrate db:test:prepare db:test:load

rails test test/model/link_map_test.rb

rails test test/controllers/link_maps_controller_test.rb

rails test test/system/link_maps_test.rb
```
