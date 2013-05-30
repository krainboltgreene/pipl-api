require "helper"

class TestPiplAPI < Minitest::Test
  def test_that_namespace_defined
    assert(defined?(Pipl::API))
  end
end
