# Rapiro Wrapper

A gem providing access to Rapiro with SerialPort.

## Installation


```ruby
gem 'rapiro_wrapper', github: 'tk-hamaguchi/rapiro_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

```
# git clone -b master --depth 1 https://github.com/tk-hamaguchi/rapiro_wrapper.git
# cd rapiro_wrapper/
# gem build rapiro_wrapper.gemspec
# gem install rapiro_wrapper-*.gem
```

## Usage

1. Require gem.
``` ruby
require 'rapiro_wrapper'
```

2. Initialize commander with serial port path.  (default: '/dev/ttyAMA0')
``` ruby
commander = RapiroWrapper::Commander.new('/dev/tty.usbserial-DA00HMG6')
```

3. Execute commands
``` ruby
## generate command sequences
sequences = [
  ## param is left: 0..90 or right: 0..90
  RapiroWrapper::Head.new( left: 30 ),

  ## param is left: 0..90 or right: 0..90
  RapiroWrapper::Waist.new( right: 30 ),

  ## param is up: 0..180  (default:0)
  RapiroWrapper::RightSholderRoll.new( up: 160 ),

  ## param is up: 0..90  (default:0)
  RapiroWrapper::RightSholderPitch.new( up: 20 ),

  ## param is hold: 0..50 or open: 0..50
  RapiroWrapper::RightHandGrip.new( hold: 0 ),

  ## param is up: 0..180  (default:0)
  RapiroWrapper::LeftSholderRoll.new( up: 30 ),

  ## param is up: 0..90  (default:0)
  RapiroWrapper::LeftSholderPitch.new( up: 20 ),

  ## param is hold: 0..50 or open: 0..50
  RapiroWrapper::LeftHandGrip.new( open: 0 ),

  ## param is close: 0..60 or open: 0..60
  RapiroWrapper::RightFootYaw.new( open: 30 ),

  ## param is close: 0..40 or open: 0..40
  RapiroWrapper::RightFootPitch.new( open: 5 ),

  ## param is close: 0..60 or open: 0..60
  RapiroWrapper::LeftFootYaw.new( close: 20 ),

  ## param is close: 0..40 or open: 0..40
  RapiroWrapper::LeftFootPitch.new( close: 0 ),

  ## param is web color code for example #000000 or hash
  RapiroWrapper::Eyes.new('#00ff00')
]
## set duration by milliseconds.  (default:10)
duration = 10

commander.execute!(sequences, duration)
```

4. Return to defaults
``` ruby
commander.execute!([])
```

## Contributing

1. Fork it ( https://github.com/tk-hamaguchi/rapiro_wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
