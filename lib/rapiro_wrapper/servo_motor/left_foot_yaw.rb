module RapiroWrapper
  # LeftFootYaw class for RAPIRO
  class LeftFootYaw < ServoMotor
    NO = 10
    DEFAULT = 90
    MIN = 50
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
