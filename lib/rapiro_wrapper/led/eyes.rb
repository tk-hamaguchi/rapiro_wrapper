module RapiroWrapper
  # Eyes class for RAPIRO
  class Eyes < Led
    def initialize(param = nil)
      if param.nil?
        @value = '#000080'
      elsif param =~ /^#([0-9a-fA-F]{2}){3}$/
        @value = param
      elsif param.instance_of?(Hash) && param.key?(:red) && param.key?(:green) && param.key?(:blue)
        @value = format('#%02x%02x%02x', *param.values_at(:red, :green, :blue))
      else
        fail ArgumentError
      end
    end

    def to_code
      vary = @value.match(/^#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$/)
                   .to_a
      vary.shift
      format('R%03dG%03dB%03d', *vary.map { |v| Integer("0x#{v}") })
    end
  end
end
