[![Build Status](https://travis-ci.com/truecoach/memoize_block.svg?branch=main)](https://travis-ci.com/truecoach/memoize_block)

# MemoizeBlock

A simple utility for memoizing.

## Usage

1. Include the `MemoizeBlock` module early enough in your application's load sequence that it is available when you need it. In Rails, this could be in an initializer.

```ruby
include MemoizeBlock
```

2. Profit!

```ruby
# basic usage
# creates an @_sum instance variable
def sum
  memoize { Fee.all.pluck(:amount).sum }
end

# override ivar
# creates an @_custom_sum instance variable
def sum
  memoize('custom_sum') { Fee.all.pluck(:amount).sum }
end
```

## Local Development

```bash
$ bundle install
$ bundle exec rspec spec
```

## Contributions

Contributions welcomed! Please link an issue in every pull request, and please include tests.
