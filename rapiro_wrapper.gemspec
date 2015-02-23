# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapiro_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = 'rapiro_wrapper'
  spec.version       = RapiroWrapper::VERSION
  spec.authors       = ['Takahiro HAMAGUCHI']
  spec.email         = ['tk.hamaguchi@gmail.com']
  spec.summary       = 'A gem providing access to Rapiro with SerialPort.'
  spec.description   = 'A gem providing access to Rapiro with SerialPort.'
  spec.homepage      = 'https://github.com/tk-hamaguchi/rapiro_wrapper.git'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'serialport', '~> 1.3'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'rubocop', '~> 0.29.0'
end
