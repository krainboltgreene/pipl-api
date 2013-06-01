Pipl API
---------

  - [![Gem Version](https://badge.fury.io/rb/pipl-api.png)](https://rubygems.org/gems/pipl-api)
  - [![Code Climate](https://codeclimate.com/github/krainboltgreene/pipl-api.png)](https://codeclimate.com/github/krainboltgreene/pipl-api)
  - [![Build Status](https://travis-ci.org/krainboltgreene/pipl-api.png)](https://travis-ci.org/krainboltgreene/pipl-api)
  - [![Dependency Status](https://gemnasium.com/krainboltgreene/pipl-api.png)](https://gemnasium.com/krainboltgreene/pipl-api)
  - [![Coverage Status](https://coveralls.io/repos/krainboltgreene/pipl-api/badge.png?branch=master)](https://coveralls.io/r/krainboltgreene/pipl-api)


The `pipl-api` is an interface for interacting with the pipl.com service.
It makes requests and generates the response as an object.


Using Pipl API
==============

There are 2 endpoints to the Pipl API:

  * Name: Get metadata on a name
  * Search (Not yet ready)

For an example of using the name endpoint read below:

``` ruby
require "pipl-api"

client = Pipl::Client.new(ENV["PIPL_API_KEY"])

client.name("James T. Kirk")

response.person.gender.to_hash #=> { :code => "male", :estimate => 0.9 }
```

You may have noticed that in order to use the Pipl API you need an API key.


Installing Pipl API
===================

Add this line to your application's Gemfile:

    gem "pipl-api", "~> 2.0"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipl-api

Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request
