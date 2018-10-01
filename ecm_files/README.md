# Ecm::Files
Short description and motivation.

## Usage
How to use my plugin.

## Prerequisites

Make sure you have installed and configured active storage.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ecm_files'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ecm_files
```

Add migrations and migrate:

```bash
$ rake ecm_files:install:migrations && rake db:migrate
```

Install routes and initializer:

```bash
$ rails g ecm:files:install
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
