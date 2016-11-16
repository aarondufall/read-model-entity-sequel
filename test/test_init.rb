ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

puts RUBY_DESCRIPTION

require 'pp'

require_relative '../init.rb'

require 'test_bench/activate'

require 'read_model/entity/sequel/controls'

Controls = ReadModel::Entity::Sequel::Controls
