ROOT = Pathname.new(File.expand_path('../..', __FILE__))
$: << ROOT

require 'pry'
require 'pry/memory'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    Pry::Memory::Generators.reset_counter!
  end
end
