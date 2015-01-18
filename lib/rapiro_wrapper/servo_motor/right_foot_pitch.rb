module RapiroWrapper
  class RightFootPitch < ServoMotor
    NO = 9
    DEFAULT = 90
    MIN = 70
    MAX = 110

    def initialize( close: nil, open: nil )
      if close
        @value = MIN + close
      elsif open
        @value = MAX - open
      else
        @value = DEFAULT
      end
      raise ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
