# Rapiro Wrapper

A gem providing access to Rapiro with SerialPort.

## Installation


```ruby
gem 'rapiro_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rapiro_wrapper


## Usage1

1. Require gem.
``` ruby
require 'rapiro_wrapper'
```

2. Initialize commander.  (default: '/dev/ttyAMA0')
``` ruby
rapiro = RapiroWrapper::Body.new
```
2.1. In another case, initialize with serial port path.
``` ruby
rapiro = RapiroWrapper::Body.new('/dev/tty.usbserial-DA00HMG6')
```
3. Set pose.
``` ruby
rapiro.head  = { left:  40 }               ## param is left: 0..90 or right: 0..90
rapiro.waist = { right: 40 }               ## param is left: 0..90 or right: 0..90
rapiro.right_sholder_roll  = { up: 120 }   ## param is up: 0..180  (default:0)
rapiro.right_sholder_pitch = { up: 20  }   ## param is hold: 0..50 or open: 0..50
rapiro.right_hand_grip     = { open: 10 }  ## param is hold: 0..50 or open: 0..50
rapiro.left_sholder_roll  = { up: 20 }     ## param is up: 0..180  (default:0)
rapiro.left_sholder_pitch = { up: 70 }     ## param is up: 0..90  (default:0)
rapiro.left_hand_grip     = { hold: 0 }    ## param is hold: 0..50 or open: 0..50
rapiro.right_foot_yaw   = { close: 10 }    ## param is close: 0..60 or open: 0..60
rapiro.right_foot_pitch = { open:  30 }    ## param is close: 0..40 or open: 0..40
rapiro.left_foot_yaw   = { open:  0 }      ## param is close: 0..60 or open: 0..60
rapiro.left_foot_pitch = { close: 0 }      ## param is close: 0..40 or open: 0..40
rapiro.eyes = '#808000'                    ## param is web color code for example #000000 or hash({red: 255, green: 255, blue: 0})
```
4. Execute.  (default: 10)
``` ruby
rapiro.execute!
```
4.1. In another case, execute with duration.
``` ruby
rapiro.execute!(90)  ## param is 0..127
```


## Usage2
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
## Execute
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
