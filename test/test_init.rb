puts RUBY_DESCRIPTION

require_relative '../init.rb'

require 'test_bench'; TestBench.activate

require 'pp'
require 'securerandom'

require 'set_attributes/controls'

Controls = SetAttributes::Controls
