module RapiroWrapper
  class LeftFootPitch < ServoMotor
    NO = 11
    DEFAULT = 90
    MIN = 70
    MAX = 110

    def initialize( close: nil, open: nil )
      if close
        @value = MAX - close
      elsif open
        @value = MIN + open
      else
        @value = DEFAULT
      end
      raise ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end