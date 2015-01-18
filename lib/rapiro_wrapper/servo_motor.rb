module RapiroWrapper
  class ServoMotor
    def initialize
      raise NotImplementedError
    end

    def to_code
      'S%02dA%03d' % [ self.class.const_get(:NO), @value ]
    end

    def self.code(options={})
      new(options).to_code
    end

    def self.find_servos
      subclasses = []
      ObjectSpace.each_object(singleton_class) do |k|
        subclasses << k if k.superclass == self
      end
      subclasses.sort! { |a, b|
        a.const_get(:NO) <=> b.const_get(:NO)
      }
      subclasses
    end
  end
end
