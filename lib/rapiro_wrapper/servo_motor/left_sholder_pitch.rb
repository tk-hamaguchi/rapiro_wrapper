module RapiroWrapper
  # LeftSholderPitch class for RAPIRO
  class LeftSholderPitch < ServoMotor
    NO = 6
    DEFAULT = 50
    MIN = 50
    MAX = 140

    def initialize(up: nil)
      if up
        @value = MIN + up
      else
        @value = DEFAULT
      end
      fail ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
