# Pry::Memory

A tiny gem for automated naming of stuff typed in the console:

```
[1] pry(main)> a = > 1
=> 1
[2] pry(main)> b = > 2
=> 2
[3] pry(main)> c = > 3
=> 3
[4] pry(main)> d = > a + b + c
=> 6
[5] pry(main)> e = >
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pry-memory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pry-memory

## Usage

This gem will be automatically required with `require 'pry'` once you put into your Gemfile.

### Configuration

Put this to your `.pryrc` file (bundler is not available in `.pryrc`, so we have to require the gem manually):
``` ruby
require 'pry/memory'
Pry::Memory.start(:abc)
```

And run `pry`.

### Customization

`:abc` is a stupid name of strategy that generates lower case letters (a,b,c,...).
Also the gem has a pre-defined strategy `:a1a2` that generates (a1,a2,a3,...):
```
[1] pry(main)> a1 = > 1
=> 1
[2] pry(main)> a2 = > 2
=> 2
[3] pry(main)> a3 = > 3
=> 3
[4] pry(main)> a4 = > a1 + a2 + a3
```

(Activate it by writting `Pry::Memory.start(:a1a2)`)

You can write your own strategy:
``` ruby
Pry::Memory.start do |counter|
  # generate a variable name here
  # you can use counter here, but it's not necessary at all
  # in fact, you can generate a random letters here
  # or even random words :)
end
```

If you still don't get what's going in this section,
check out [this file](https://github.com/iliabylich/pry-memory/blob/master/lib/pry/memory/generators.rb#L39)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pry-memory/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
