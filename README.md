# lita-onewheel-check-headers

[![Build Status](https://travis-ci.org/onewheelskyward/lita-onewheel-check-headers.png?branch=master)](https://travis-ci.org/onewheelskyward/lita-onewheel-check-headers)
[![Coverage Status](https://coveralls.io/repos/onewheelskyward/lita-onewheel-check-headers/badge.svg)](https://coveralls.io/r/onewheelskyward/lita-onewheel-check-headers)
[![Documentation Status](https://readthedocs.org/projects/lita-onewheel-check-headers/badge/?version=latest)](https://readthedocs.org/projects/lita-onewheel-check-headers/?badge=latest)

This Lita handler checks websites for headers.

## Installation

Add lita-onewheel-check-headers to your Lita instance's Gemfile:

``` ruby
gem 'lita-onewheel-check-headers', '~> 0'
```

## Configuration

``` ruby
Lita.configure do |config|
  config.handlers.onewheel_check_headers.urls = %w(uri1 uri2)
  config.handlers.onewheel_check_headers.headers = %w(headers to look for)
end
```

## Usage

!lllrev

## License

[MIT](http://opensource.org/licenses/MIT)
