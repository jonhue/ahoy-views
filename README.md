# Ahoy Views

[![Gem Version](https://badge.fury.io/rb/ahoy-views.svg)](https://badge.fury.io/rb/ahoy-views) <img src="https://travis-ci.org/jonhue/ahoy-views.svg?branch=master" />

Track views of ActiveRecord objects in Rails. Ahoy Views depends on [Ahoy](https://github.com/ankane/ahoy).

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Tracking](#tracking)
        * [Types](#types)
    * [`ahoy_viewable`](#ahoy_viewable)
    * [`ahoy_viewer`](#ahoy_viewer)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

**Note:** Before installing Ahoy Views make sure to setup the original [Ahoy](https://github.com/ankane/ahoy) gem.

Ahoy Views works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'ahoy-views'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ahoy_views

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'ahoy-views', github: 'jonhue/ahoy-views'
```

Now run the generator:

    $ rails g ahoy_views

Lastly make sure to call `ahoy_views` from your `Ahoy::Event` class:

```ruby
module Ahoy
    class Event < ApplicationRecord
        ahoy_views
    end
end
```

---

## Usage

### Tracking

#### Types

### `ahoy_viewable`

### `ahoy_viewer`

---

## To Do

[Here](https://github.com/jonhue/ahoy-views/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/ahoy-views/issues/new).

---

## Contributing

We hope that you will consider contributing to Ahoy Views. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/ahoy-views/graphs/contributors

### Semantic Versioning

Ahoy Views follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2018 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
