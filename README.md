# README

### What is this APP for?

Create fake endpoints to be able to access them by other applications, for the purpose of simulating responses

If the url is not registered, it will attempt the request according to what is configured in `origin_host`

### But how?

Create, update or remove endpoints, see through the "/mocks" route

Access the created endpoint, if it is running locally:

http/localhost:your_port/your_end_point/

### How to configure?
- Create the file config/settings.xml and paste the config below, replace values according yours necessities

```yaml
default: &default
  origin_host: https://host.com
  origin_service_name: service_host

  systems_cas:
    base:  'https://$cas-base/'
    base_authority: base_authority
    service: 'service.com.br'
    username:   'username'
    password:   'password'
    verify_ssl: false

development:
  <<: *default

```
In this app, is used `gem cassette` to make authentication, where `origin_host:` is your real API host, the one you want to simulate behavior.

The `service_host` is service name used by `gem cassette`, to geneate services tickets.

it is interesting to enable the cache, with command `rails dev:cache`, so that it controls the TGT (ticket granting ticket) usage that is used to generate the ST (service ticket).

To clear cache of `gem cassette` run the command below on `rails console`:
```ruby
Cassette::Client.cache.backend.clear
```
More information of [Cassette](https://github.com/locaweb/cassette)

### RUN


- bundle install

- rake db:setup

- RACK_ENV=none RAILS_ENV=development unicorn -c config/unicorn.rb -p 3002

- See the "config/unicorn.rb" for configure workers

Warning:

This APP is just an experiment, there is a lot to improve.

* Ruby version
  ruby 2.3.3p222

* Rails Verison
  Rails 5.2.4.3

