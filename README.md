## isms-ruby

A wrapper gem for iSMS (Malaysia) API.

Check [www.isms.com.my](www.isms.com.my) for API documentation.

Currently only supports sending SMS.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'isms-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isms-ruby

## Usage

In an initializer file, configure as follows:

```ruby
require 'isms'

ISMS.configure do |config|
  config.username = ENV['ISMS_USERNAME'] || 'username'
  config.password = ENV['ISMS_PASSWORD'] || 'password'
  config.protocol = 'https'
end
```

Then, initialize a client and send an SMS as follows:

```ruby
client = ISMS::Client.new
response = client.send_sms('Hello world!', '60121231234')

# => { code: 200, description: 'SUCCESS' }
# => { code: -1001, description: 'AUTHENTICATION FAILED' }
# etc.
```

Check out other response codes at [http://isms.com.my/response_result.php](http://isms.com.my/response_result.php)

## Contributing

1. Fork it ( https://github.com/ernsheong/isms-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

To run the specs:

    $ bundle exec rspec