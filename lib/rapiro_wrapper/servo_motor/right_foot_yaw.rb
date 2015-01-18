module RapiroWrapper
  class RightFootYaw < ServoMotor
    NO = 8
    DEFAULT = 90
    MIN = 70
    MAX = 130

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
