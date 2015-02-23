module RapiroWrapper
  # Waist class for RAPIRO
  class Waist < ServoMotor
    NO = 1
    DEFAULT = 90
    MIN = 0
    MAX = 180

    def initialize(left: nil, right: nil)
      fail ArgumentError if left && right
      if left
        @value = DEFAULT + left
      elsif right
        @value = DEFAULT - right
      else
        @value = DEFAULT
      end
      fail ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
