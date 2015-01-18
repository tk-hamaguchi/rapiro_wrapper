module RapiroWrapper
  class Eyes < Led
    def initialize(param=nil)
      if param.nil?
        @value = '#000080'
      elsif param.instance_of(Hash) && param.key?(:red) && param.key?(:green) && param.key?(:blue)
        @value = '#%02x%02x%02x' % param.values_at(:red, :green, :blue)
      elsif param =~ /^#([0-9a-fA-F]{2}){3}$/
        @value = param
      else
        raise ArgumentError
      end
    end

    def to_code
      vary = @value.match(/^#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$/).to_a
      vary.shift
      'R%03dG%03dB%03d' % vary.map { |v| Integer("0x#{v}") }
    end
  end
end
