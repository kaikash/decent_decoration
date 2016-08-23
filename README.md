# decent_decoration
[![Build Status](https://secure.travis-ci.org/netguru/decent_decoration.png?branch=master)](http://travis-ci.org/netguru/decent_decoration)
[![Code Climate](https://codeclimate.com/github/netguru/decent_decoration.png)](https://codeclimate.com/github/netguru/decent_decoration)
[![Coverage Status](https://coveralls.io/repos/netguru/decent_decoration/badge.png?branch=master)](https://coveralls.io/r/netguru/decent_decoration)
[![Gem Version](https://badge.fury.io/rb/decent_decoration.png)](http://badge.fury.io/rb/decent_decoration)

decent_decoration allows you to use excellent [decent_exposure 3.0][decent_exposure] gem with decorators.

## Installation

Add this line to your application's Gemfile:

```
gem 'decent_decoration', '~> 1.0'
```

And then execute:

```
$ bundle
```

## Usage

``` ruby
# app/controllers/conferences_controller.rb
# with decent_exposure
class ConferencesController < ApplicationController
  expose(:conference) { ConferenceDecorator.new(build_conference) }

  private

  def build_conference
    # create new conference or fetch existing one
  end
end

# with decent_decoration
class ConferencesController < ApplicationController
  expose_decorated(:conference)
end
```

decent_decoration makes decorated objects accessible in views. They remain undecorated in your controllers.

Define a decorator explicitly:

``` ruby
# app/controllers/conferences_controller.rb
class ConferencesController < ApplicationController
  expose_decorated(:conference, decorator: SponsoredConferenceDecorator)
end
```

decent_decoration detect automatically if you want to decorate a collection. To circumvent this pass collection: true/false

``` ruby
# app/controllers/conferences_controller.rb
class ConferencesController < ApplicationController
  expose_decorated(:conferences, collection: false)
end
```

decent_decoration supports most of the awesome [decent_exposure api][decent_exposure_api]. Read [more about it!][decent_exposure_api]

``` ruby
# app/controllers/attendees_controller.rb
class AttendeesController < ApplicationController
  expose_decorated(:conference)
  expose_decorated(:attendees, scope: :conference)
end
```

You can use any decorator mechanism as long as `ConferenceDecorator` responds to `#decorate` or `#new`. Try [draper][draper].

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[decent_exposure]: https://github.com/voxdolo/decent_exposure
[decent_exposure_api]: https://github.com/voxdolo/decent_exposure#usage
[draper]: https://github.com/drapergem/draper

Copyright © 2012–2014 [netguru](https://netguru.co). See LICENSE for further details.
