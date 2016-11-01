# README

## Dependencies:
* ruby: 2.2.4
* rails: 5.0.0.1
* postgreSQL: 9.5.4

## Setup:
```sh
git clone https://github.com/falterfriday/ruby_demo.git
cd ruby_demo
bundle install
rake db:create
rake db:migrate
rails s
```

## Testing
```sh
rails generate rspec:install
rspec spec
```
