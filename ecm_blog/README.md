# Ecm::Blog
Short description and motivation.

## Usage
How to use my plugin.

## Prerequisites

For correct pagination rendering you have to add kmaniari views via the correct gem.

For bootstrap 3:

    # Gemfile
    gem 'twitter-bootstrap-3'


For bootstrap 4:

    # Gemfile
    gem 'twitter-bootstrap-3'

Please ensure to set the correct pagination options (pagination_options_proc) as documented in the initializer.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ecm_blog'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ecm_blog
```

Add migrations and migrate:

```bash
$ rake ecm_blog:install:migrations && rake db:migrate
```

Install routes and initializer:

```bash
$ rails g ecm:blog:install
```

## Updating to 1.3.0

Version 1.3.0 brings you positionable posts via acts_as_list. You have to migrate and initialize the post positions like this:

```bash
$ rake ecm_blog:install:migrations db:migrate ecm:blog:initialize_post_positions
```

## Configuration

See the generated initializer in config/initializers/ecm_blog.rb for configuration options.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
