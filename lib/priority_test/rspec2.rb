require 'rspec/core'
require_path 'rspec2/relative_path'
require_path 'rspec2/formatter'
require_path 'rspec2/sorter'
require_path 'rspec2/ordered_filtered_examples'

module PriorityTest
  module RSpec2

    def self.formatter
      Formatter.new(PriorityTest.test_result_collector)
    end

    def self.filter
      lambda { |k, v|
        PriorityTest.service.priority_test?(v[:full_description])
      }
    end
  end
end
