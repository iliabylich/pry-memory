require 'spec_helper'

describe Pry::Memory::Generators do
  context '.counter' do
    it 'is a memoized value is default = 1' do
      expect {
        Pry::Memory::Generators.counter = 2
      }.to change {
        Pry::Memory::Generators.counter
      }.from(1).to(2)
    end
  end

  context '.new' do
    let(:generator) do
      Pry::Memory::Generators.new { |counter| counter * 2 }
    end

    it 'returns generator that invokes provided block for .counter' do
      expect {
        Pry::Memory::Generators.counter = 2
      }.to change {
        generator.generate
      }.from(2).to(4)
    end

    it 'can change global .counter' do
      expect {
        generator.next!
        generator.next!
      }.to change {
        generator.generate
      }.from(2).to(6)
    end
  end

  context 'pre-defined generators' do
    context 'abc generator' do
      let(:generator) { Pry::Memory::Generators::PREDEFINED[:abc] }

      it 'generates lower letter' do
        expect {
          generator.next!
        }.to change {
          generator.generate
        }.from('a').to('b')
      end
    end

    context 'a1a2' do
      let(:generator) { Pry::Memory::Generators::PREDEFINED[:a1a2] }

      it 'generates a1, a2, a3...' do
        expect {
          generator.next!
        }.to change {
          generator.generate
        }.from('a1').to('a2')
      end
    end
  end
end
