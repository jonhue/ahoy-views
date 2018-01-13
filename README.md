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

You can track views for ActiveRecord objects from your controllers:

```ruby
class ArticleController < ApplicationController

    def index
        @articles = Article.all
        ahoy_view @articles
    end

    def show
        @article = Article.find params[:id]
        ahoy_view @article
    end

end
```

**Note:** This will create an `Ahoy::Event` object for every record passed.

The `current_visit` object, if present, will be automatically associated with every visit.

You are also able to associate other records with views. [Learn more](#ahoy_viewer).

#### Types

You can pass an array of `types` to `ahoy_view`. Types allow you to track multiple types of visits. The `:types` option defaults to `[:view]`.

```ruby
ahoy_view @article, types: [:view, :visitor, :returnee, :unique_visitor, :unique_returnee]
```

Here is a list of available types:

* `:view` stores every call to `ahoy_view` for an object.

* `:visitor` stores only one view per visit.

* `:returnee` stores only one view per visit if the visitor has viewed the object before.

* `:unique_visitor` stores only one view per visitor.

* `:unique_returnee` stores only one view per visitor if the visitor has viewed the object before.

### `ahoy_viewable`

Add `ahoy_viewable` to an ActiveRecord class.

```ruby
class Article < ApplicationRecord
    ahoy_viewable
end

a = Article.first

# All belonging Ahoy::Event objects that are a view
a.ahoy_views

# All viewer records that have a view object
a.ahoy_viewers

# Scope to order Article records by views
Article.trending

# Whether or not a is one of the 5 "most trending" articles
a.trending? 5
```

### `ahoy_viewer`

Add `ahoy_viewer` to an ActiveRecord class.

```ruby
class User < ApplicationRecord
    ahoy_viewer
end

u = User.first

# All belonging Ahoy::Event objects that are a view
u.ahoy_visits

# All records that this user has taken a look at
u.ahoy_viewed
```

Here is how to associate a viewer with a view:

```ruby
ahoy_view @article, viewer: current_user
```

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
