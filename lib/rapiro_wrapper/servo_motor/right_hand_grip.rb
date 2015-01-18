module RapiroWrapper
  class RightHandGrip < ServoMotor
    NO = 4
    DEFAULT = 90
    MIN = 60
    MAX = 110

    def initialize( hold: nil, open: nil )
      if hold
        @value = MIN + hold
      elsif open
        @value = MAX - open
      else
        @value = DEFAULT
      end
      raise ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
