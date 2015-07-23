require "pry/memory/version"

class Pry
  module Memory
    autoload :Hook, 'pry/memory/hook'
    autoload :Generators, 'pry/memory/generators'
    autoload :Strategy, 'pry/memory/strategy'
    autoload :Prompt, 'pry/memory/prompt'

    class << self
      def start(strategy = nil, &block)
        Strategy.configure(strategy, &block)
        Prompt.replace
        Hook.register
      end

      def stop
        Prompt.restore
        Hook.unregister
      end
    end
  end
end
