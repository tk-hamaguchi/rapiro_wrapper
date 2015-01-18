module RapiroWrapper
  class RightSholderRoll < ServoMotor
    NO = 2
    DEFAULT = 0
    MIN = 0
    MAX = 180

    def initialize(up: DEFAULT)
      @value = up
      raise ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
