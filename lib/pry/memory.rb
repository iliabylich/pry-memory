require "pry/memory/version"

class Pry
  module Memory
    autoload :Hook,       'pry/memory/hook'
    autoload :Generators, 'pry/memory/generators'
    autoload :Strategy,   'pry/memory/strategy'
    autoload :Prompt,     'pry/memory/prompt'

    class << self
      # Runs some patches
      #  and prepares pry for storing all
      #  evaluated variables
      #
      def start(strategy = nil, &block)
        Strategy.configure(strategy, &block)
        Prompt.replace
        Hook.register
      end

      # Stops all activity
      #  and restore patched configuration
      #  to its original state
      #
      def stop
        Prompt.restore
        Hook.unregister
      end
    end
  end
end
