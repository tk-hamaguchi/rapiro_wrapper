module RapiroWrapper
  # Controll class for RAPIRO
  class Body
    def initialize(device = '/dev/ttyAMA0')
      @commander  = RapiroWrapper::Commander.new(device)
      servo_class = RapiroWrapper::ServoMotor.find_servos

      @servos = servo_class.inject({}) do |hash, klass|
        class_name = klass.to_s
        snake_case = class_name.gsub(/::/, '/')
                               .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
                               .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                               .tr('-', '_').downcase
        hash[snake_case.split('/').last] = klass
        hash
      end
      @servos['eyes'] = RapiroWrapper::Eyes
      @servos.each do |s, k|
        self.class.class_eval <<-EOF
          def #{s}=(val)
            @#{s} = #{k}.new(val)
          end

          def #{s}
            @#{s}
          end
        EOF
        instance_variable_set('@'.concat(s).to_sym, k.new)
      end
    end

    def sequences(duration = 10)
      @commander.sequences(
        @servos.keys.map { |k| instance_variable_get('@'.concat(k).to_sym) },
        duration
      )
    end

    def execute!(duration = 10)
      @commander.write(sequences(duration))
    end
  end
end
