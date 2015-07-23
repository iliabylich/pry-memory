module Pry::Memory::Prompt
  extend self

  PROMPT = [
    proc { |target_self, nest_level, pry|
      was = Pry::DEFAULT_PROMPT[0].call(target_self, nest_level, pry)
      extra = (nest_level.zero? ? "#{Pry::Memory::Strategy.variable_name} = > " : '0')
      was + extra
    },
    proc { |target_self, nest_level, pry|
      was = Pry::DEFAULT_PROMPT[1].call(target_self, nest_level, pry)
      extra = (nest_level.zero? ? "#{Pry::Memory::Strategy.variable_name} = > " : '0')
      was + extra
    }
  ]

  def replace
    @old_prompt = Pry.prompt
    Pry.prompt = PROMPT
  end

  def restore
    Pry.prompt = Pry::DEFAULT_PROMPT
  end
end
