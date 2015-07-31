# Class responsible for adding hook to pry
#
# @example
#   Pry::Memory::Hook.register
#   # hook registered
#   Pry::Memory::Hook.unregister
#   # hook unregister
#
module Pry::Memory::Hook
  extend self

  PRY_HOOK = :after_eval
  HOOK_NAME = 'pry-memory'

  def register
    Pry.hooks.add_hook PRY_HOOK, HOOK_NAME do |result, pry_instance|
      if result
        pry_binding = pry_instance.current_binding
        variable_name = Pry::Memory::Strategy.variable_name
        pry_binding.local_variable_set(variable_name, result)
        Pry::Memory::Strategy.next!
      end
    end
  end

  def unregister
    Pry.hooks.delete_hook(PRY_HOOK, HOOK_NAME)
  end
end
