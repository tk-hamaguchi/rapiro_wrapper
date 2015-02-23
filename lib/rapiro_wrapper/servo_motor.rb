module RapiroWrapper
  # SurvoMotor class for RAPIRO
  class ServoMotor
    def initialize
      fail NotImplementedError
    end

    def to_code
      format('S%02dA%03d', self.class.const_get(:NO), @value)
    end

    def self.code(options = {})
      new(options).to_code
    end

    def self.find_servos
      subclasses = []
      ObjectSpace.each_object(singleton_class) do |k|
        subclasses << k if k.superclass == self
      end
      subclasses.sort! do |a, b|
        a.const_get(:NO) <=> b.const_get(:NO)
      end
      subclasses
    end
  end
end
