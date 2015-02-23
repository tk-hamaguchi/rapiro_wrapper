module RapiroWrapper
  # LeftSholderRoll for RAPIRO
  class LeftSholderRoll < ServoMotor
    NO = 5
    DEFAULT = 180
    MIN = 0
    MAX = 180

    def initialize(up: nil)
      if up
        @value = MAX - up
      else
        @value = DEFAULT
      end
      fail ArgumentError unless @value.between?(MIN, MAX)
    end
  end
end
