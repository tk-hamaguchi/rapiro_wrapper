module RapiroWrapper
  # RightFootPitch class for RAPIRO
  class RightFootPitch < ServoMotor
    NO = 9
    DEFAULT = 90
    MIN = 70
    MAX = 110

    def initialize(close: nil, open: nil)
      fail ArgumentError if open && close
      if close
        @value = MIN + close
      elsif open
        @value = MAX - open
      else
        @value = DEFAULT
      end
      fail ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
