# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-set_attributes'
  s.version = '0.4.0.0'
  s.summary = "Set an object's attributes from a hash or an object that implements to_h"
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/set-attributes'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_development_dependency 'test_bench'
end
