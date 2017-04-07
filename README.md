# Durationizer

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/durationizer`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'durationizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install durationizer

## Usage

Durationizer is built to use within Rails models extending `ActiveRecord::Base`.

To start, add an integer column with suffix `_in_seconds` to your model's database table. This is intended to create a convention of `_in_seconds` as a suffix for duration columns.

Given a `delay_time_in_seconds` column, basic usage is:

```rb
class Notification < ActiveRecord::Base
  durationize :delay_time_in_seconds
end
```

Durationizer makes the `delay_time` and `delay_time=` methods available. Now you can read and write `delay_time` as an `ActiveSupport::Duration` object. The actual value will be stored in the database as seconds.

```rb
notification = Notification.first
notification.delay_time = 1.minute
# => 60 seconds
notification.delay_time_in_seconds
# => 60
```

Go ahead, use that `ActiveSupport::Duration` object:

```rb
Time.now.utc
# => 2017-03-07 00:30:28 UTC
notification.delay_time.from_now
# => 2017-03-07 00:31:30 UTC
Time.now.utc - notification.delay_time
# => 2017-03-07 00:29:30 UTC
```

### Specifying time unit

To improve user experience, you may want to allow a user to specify a duration with a number/range form field and a select/radio containing a duration (minutes, hours, days, etc.).

The `durationize` method takes a `unit:` option, specifying which model attribute contains that time unit. The `_in_units` reader and writer methods then convert duration accordingly.

```rb
class Notification < ActiveRecord::Base
  durationize :delay_time_in_seconds, unit: :delay_time_unit
end
```

The unit column may have any name. We suggest the `_unit` suffix.

```rb
notification = Notification.first
notification.delay_time_unit = 'minutes'
notification.delay_time_in_units = 2
notification.delay_time
# => 120 seconds
```

To hardcode the duration unit, you may use a public method.

```rb
class Notification < ActiveRecord::Base
  durationize :delay_time_in_seconds, unit: :delay_time_unit
 
  def delay_time_unit
    'hours'
  end
end
```

Heads up — always specify the `durationize` `unit` option when you intend to use the `*_in_units` methods. Calling the `*_in_units` reader or writer method without specifying a `unit` option in `durationize` will return a `NoMethodError`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/skyverge/durationizer.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT). See [LICENSE](https://github.com/skyverge/durationizer/blob/master/LICENSE) file for details.
