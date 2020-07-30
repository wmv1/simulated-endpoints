# README

### What is this APP for?

Create fake endpoints to be able to access them by other applications, for the purpose of simulating responses

### But how?

Create, update or remove endpoints, see through the "/mocks" route

Access the created endpoint, if it is running locally:

http/localhost:your_port/your_end_point/


* Ruby version
  ruby 2.3.3p222

* Rails Verison
  Rails 5.2.4.3

### RUN
- bundle install

- rake db:setup

- RACK_ENV=none RAILS_ENV=development unicorn -c config/unicorn.rb -p 3002

- See the "config/unicorn.rb" for configure workers

Warning:

This APP is just an experiment, there is a lot to improve.


