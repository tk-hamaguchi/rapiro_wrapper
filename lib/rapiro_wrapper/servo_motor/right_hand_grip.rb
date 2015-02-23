module RapiroWrapper
  # RightHandGrip class for RAPIRO
  class RightHandGrip < ServoMotor
    NO = 4
    DEFAULT = 90
    MIN = 60
    MAX = 110

    def initialize(hold: nil, open: nil)
      fail ArgumentError if open && hold
      if hold
        @value = MIN + hold
      elsif open
        @value = MAX - open
      else
        @value = DEFAULT
      end
      fail ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
