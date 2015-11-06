# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'set_attributes'
  s.summary = "Set an object's attributes"
  s.version = '0.1.0'
  s.authors = ['']
  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'dependency'
  s.add_runtime_dependency 'telemetry-logger'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-spec-context', '~> 0'
  s.add_development_dependency 'pry', '~> 0'
  s.add_development_dependency 'runner', '~> 0'
end
