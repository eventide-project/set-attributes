require_relative 'test_init'

Runner.! 'spec/set_attributes/*.rb' do |exclude|
  exclude =~ /_init.rb\z/
end
