require 'serialport'

module RapiroWrapper
  class Commander
    def initialize(device='/dev/ttyAMA0')
      @serial = SerialPort.new(device, 57600)
    end
    def execute!(commands, duration=10)
      @serial.write(sequences(commands, duration))
    end

    def sequences(commands, duration=10)
      RapiroWrapper::Command.new(commands).to_sequence(duration)
    end

    def self.dryrun(commands, duration=10)
      RapiroWrapper::Command.new(commands).to_sequence(duration)
    end
  end
end
