# Pokemon Go Status

A simple gem that will tell you if Pokemon Go is available.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pokemon-go-status'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pokemon-go-status

## Usage

To use in a Ruby app:

```ruby
require 'melonsmasher/pokemon-go-status'

pg = PokemonGoStatus::Status.new
status = pg.get_server_status
puts status.inspect

# Possible status objects:
#
# "{:exit_code=>0, :description=>\"All good! Go catch'em all!\", :avg_ms=>547, :available=>true}"
# "{:exit_code=>3, :description=>\"Error! Probably not a good sign, but try again.\", :avg_ms=>-1, :available=>false}"
# "{:exit_code=>1, :description=>\"Servers are slow. Your mileage may vary.\", :avg_ms=>1381, :available=>true}"
# "{:exit_code=>2, :description=>\"Servers don't seem to be up.\", :avg_ms=>4557, :available=>false}"

if status.available
    puts 'Woot Woot! They\'r up!'
else
    puts 'Dang, maybe next time.'
    exit status.exit_code
end

```

Commandline usage is simple:

    $ pgo-status
    All good! Go catch'em all!
    Average response time: 547 ms.
    $ pgo-status
    Servers are slow. Your mileage may vary.
    Average response time: 1381 ms.
    $ pgo-status
    Servers don't seem to be up.
    Average response time: 4557 ms.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/melonsmasher/pokemon-go-status. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

