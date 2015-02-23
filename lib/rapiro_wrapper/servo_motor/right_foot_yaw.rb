module RapiroWrapper
  # RightFootYaw class for RAPIRO
  class RightFootYaw < ServoMotor
    NO = 8
    DEFAULT = 90
    MIN = 70
    MAX = 130

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
