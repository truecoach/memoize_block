# frozen_string_literal: true

require "memoize_block/version"

module MemoizeBlock
  #
  # A memoization helper designed to DRY up the memoization logic we use
  # across the app. Examples A and B have the same memoization result:
  #
  # Example A:
  # class Processor
  #   def calcuate
  #     memoize { ExpensiveQuery.call }
  #   end
  # end
  #
  # Example B:
  # class Processor
  #   def calcuate
  #     return @_calculate if defined?(@_caculate)
  #     @_calculate = ExpensiveQuery.call
  #   end
  # end
  #
  def memoize(ivar_name = nil)
    ivar_name = caller_locations[0].label if ivar_name.nil?

    raise 'invalid ivar name' if ivar_name.match(/@|!/)

    full_ivar_name = "@_#{ivar_name}"

    return instance_variable_get(full_ivar_name) if instance_variable_defined?(full_ivar_name)

    instance_variable_set(full_ivar_name, yield)
  end
end
