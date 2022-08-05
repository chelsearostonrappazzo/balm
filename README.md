# Balm

A simple to use gem that will generate random character types, tropes and/or settings. Most useful for writers in a rut if you need to jumpstart inspiration.

Called 'balm' to soothe the headaches of writer's block. Also great to generate random prompts for writing practice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'balm'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install balm

## Usage

```ruby
require 'balm'

Balm::Plot.trope        #=> "Arranged Marriage"
Balm::Plot.archetype(4) #=> "Minor God, Curate, Bard, and Ghost"
Balm::Plot.setting      #=> "The ruins of a Castle"
Balm::Plot.all(2) #=> {:trope=>"Helping each other get revenge", :archetypes=>"Ghost and King", :setting=>"The city just before dawn"}
Balm::Plot.all(3, "prompt")       #=>  "Once upon a time, a Mage, Princess, and Dandy in The city just before dawn and One is a Celebrity and the other is not."

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chelsearostonrappazzo/balm. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/balm/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Balm project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/balm/blob/master/CODE_OF_CONDUCT.md).
