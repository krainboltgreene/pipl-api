require "helper"

class TestPiplAPIVersion < Minitest::Test
  def test_that_version_exists
    assert(defined?(Pipl::API::VERSION))
  end
end
