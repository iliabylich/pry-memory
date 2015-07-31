# Class responsible for generating
#  variable names
#
# @example
#   Pry::Memory::Strategy.variable_name
#   # => 'a'
#   Pry::Memory::Strategy.next!
#   Pry::Memory::Strategy.variable_name
#   # => 'b'
#
module Pry::Memory::Strategy
  extend self

  def configure(strategy, &block)
    @strategy = if strategy
      Pry::Memory::Generators::PREDEFINED[strategy]
    elsif block_given?
      Pry::Memory::Generators.new(&block)
    else
      raise "Strategy must be specified using Symbol or block"
    end
  end

  attr_reader :strategy
  def variable_name
    strategy.generate
  end

  def next!
    strategy.next!
  end
end
