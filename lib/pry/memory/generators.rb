# Module for generating generators (yes-yes)
#
# @example
#   g = Pry::Memory::Generators.new { |counter| counter * 2}
#   g.generate
#   # => 2
#   g.next!; g.generate
#   # => 4
#
# Two commonly used (probably) strategies are pre-defined:
#   1. :abc - generates a/b/c/d... sequence
#   2. :a1a2 - generates a1/a2/a3... sequence
#
module Pry::Memory::Generators
  extend self

  def counter
    @counter ||= 1
  end
  attr_writer :counter

  def reset_counter!
    @counter = 1
  end

  def new(&block)
    Class.new do
      define_method :generate do
        block.call(Pry::Memory::Generators.counter)
      end

      define_method :next! do
        Pry::Memory::Generators.counter += 1
      end
    end.new
  end

  PREDEFINED = {
    :abc => new { |counter| ('a'..'z').to_a[counter - 1] },
    :a1a2 => new { |counter| "a#{counter}" }
  }
end
