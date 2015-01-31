module RapiroWrapper
  class LeftHandGrip < ServoMotor
    NO = 7
    DEFAULT = 90
    MIN = 60
    MAX = 110

    def initialize( hold: nil, open: nil )
      fail ArgumentError if open && hold
      if hold
        @value = MAX - hold
      elsif open
        @value = MIN + open
      else
        @value = DEFAULT
      end
      raise ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
