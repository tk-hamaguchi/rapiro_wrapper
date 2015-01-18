module RapiroWrapper
  class Command

    def initialize(sequences=[])
      @sequences = sequences
    end

    def to_sequence(duration=10)
      seq = (RapiroWrapper::ServoMotor.find_servos + [RapiroWrapper::Eyes]).inject([]) do |ary, servo|
        s = @sequences.find { |item|
          item.instance_of?(servo)
        }
        ary << ( s ? s : servo.new )
        ary
      end

      "#P#{seq.map(&:to_code).join}T%03d" % duration
    end

  end
end
