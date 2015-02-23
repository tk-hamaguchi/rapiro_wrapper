require 'serialport'

module RapiroWrapper
  # Commander class for RAPIRO
  class Commander
    def initialize(device = '/dev/ttyAMA0')
      @serial = SerialPort.new(device, 57_600)
    end

    def execute!(commands, duration = 10)
      write(sequences(commands, duration))
    rescue
      write('#M0')
    end

    def sequences(commands, duration = 10)
      RapiroWrapper::Command.new(commands).to_sequence(duration)
    end

    def self.dryrun(commands, duration = 10)
      RapiroWrapper::Command.new(commands).to_sequence(duration)
    end

    def write(sequences)
      @serial.write(sequences)
    end
  end
end
