module RapiroWrapper
  # RightSholderPitch class for RAPIRO
  class RightSholderPitch < ServoMotor
    NO = 3
    DEFAULT = 130
    MIN = 40
    MAX = 130

    def initialize(up: nil)
      if up
        @value = MAX - up
      else
        @value = DEFAULT
      end
      fail ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
