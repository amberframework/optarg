# optarg

Yet another library for parsing command-line options and arguments, written in the Crystal language.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  optarg:
    github: mosop/optarg
```

## Features

* Easy Access

  ```crystal
  class Model < Optarg::Model
    string "--foo"
  end

  result = Model.parse(%w(--foo bar))
  result.foo # => "bar"
  ```

* Nilable Accessor

  ```crystal
  class Model < Optarg::Model
    string "--foo"
  end

  result = Model.parse(%w())
  result.foo? # => nil
  result.foo # raises KeyError
  ```

* Default Value

  ```crystal
  class Model < Optarg::Model
    string "--foo", default: "bar"
  end

  result = Model.parse(%w())
  result.foo # => "bar"
  ```

* Boolean Value

  ```crystal
  class Model < Optarg::Model
    bool "-b"
  end

  result = Model.parse(%w(-b))
  result.b? # => true
  ```

* Nagation

  ```crystal
  class Model < Optarg::Model
    bool "-b", not: "-B"
  end

  result = Model.parse(%w(-B))
  result.b? # => false
  ```

* Non-option Arguments

  ```crystal
  class Model < Optarg::Model
    string "-s"
    bool "-b"
  end

  result = Model.parse(%w(-s foo -b bar -- baz))
  result.args # => ["bar"]
  result.unparsed_args # => ["baz"]
  ```

## Usage

```crystal
require "optarg"
```

and see Features.

## Development

[WIP]

## Contributing

1. Fork it ( https://github.com/mosop/optarg/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [mosop](https://github.com/mosop) - creator, maintainer
