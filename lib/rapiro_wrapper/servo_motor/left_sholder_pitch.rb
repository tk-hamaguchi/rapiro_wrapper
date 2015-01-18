module RapiroWrapper
  class LeftSholderPitch < ServoMotor
    NO = 6
    DEFAULT = 50
    MIN = 50
    MAX = 140

    def initialize( up: nil )
      if up
        @value = MIN + up
      else
        @value = DEFAULT
      end
      raise ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
