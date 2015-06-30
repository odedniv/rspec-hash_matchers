# RSpec::HashMatchers

This gem is an extension to [RSpec](https://github.com/rspec/rspec) that allows
additional matchers for ruby hashes.

Especially useful when testing API responses.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-hash_matchers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-hash_matchers

## Usage

### Contain exactly keys (in array)

Like RSpec's `contain_exactly`, but for hash and array of hashes.

* Order never matters
* Allows any mix of keys and keys with values (make sure you put the keys with
  values last)
* Must contain all entries (hash keys or array entries), nothing more and
  nothing less

```ruby
specify do
  # Hash
  expect(a: 1, b: 2, c: 3, d: 4).to contain_exactly_keys :d, :b, c: 3, a: 1
  # Array of hashes
  expect([
    { a: 1, b: 2, c: 3 },
    { d: 4, e: 5, f: 6 },
    { g: 7, h: 8, i: 9 },
  ]).to contain_exactly_keys_in_array(
    [:e, f: 6, d: 4],     # second line
    [:a, :b, :c],         # first line
    { i: 9, h: 8, g: 7 }, # third line
  )
end
```

See [the spec](spec/rspec/hash_matchers/contain_exactly_spec.rb) for all
examples of matches and mismatches.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/odedniv/rspec-hash_matchers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

