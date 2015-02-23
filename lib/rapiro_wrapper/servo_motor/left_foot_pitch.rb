module RapiroWrapper
  # LeftFootPitch class for RAPIRO
  class LeftFootPitch < ServoMotor
    NO = 11
    DEFAULT = 90
    MIN = 70
    MAX = 110

    def initialize(close: nil, open: nil)
      fail ArgumentError if open && close
      if close
        @value = MAX - close
      elsif open
        @value = MIN + open
      else
        @value = DEFAULT
      end
      fail ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
