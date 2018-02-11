require 'active_support'

module RSpec
  module HashMatchers
    module ContainExactlyKeys
      extend RSpec::Matchers::DSL

      matcher :contain_exactly_keys do |*expected|
        match do |actual|
          hash_matchers_contain_exactly_keys?(actual, expected)
        end
      end

      matcher :contain_exactly_keys_in_array do |*expected|
        match do |actual|
          next false if not actual.is_a?(Array)
          next false if actual.length != expected.length
          actual = actual.clone
          expected = expected.clone
          result = true
          while expected.any?
            e = expected.shift
            i = actual.find_index { |a| hash_matchers_contain_exactly_keys?(a, e) }
            break result = false if i.nil?
            actual.delete_at(i)
          end
          result
        end
      end

      def hash_matchers_contain_exactly_keys?(actual, expected)
        return false if not actual.is_a?(Hash)

        array = expected.is_a?(Hash) ? [expected] : expected.clone
        hash = array.extract_options!

        return false if actual.length != array.length + hash.length
        return false if array.any? { |k| not actual.include?(k) }
        return false if hash.any? { |k, v| actual[k] != v }
        true
      end
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::HashMatchers::ContainExactlyKeys
end
