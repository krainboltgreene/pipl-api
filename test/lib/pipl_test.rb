require "helper"

class TestPipl < Minitest::Test
  def test_that_namespace_defined
    assert(defined?(Pipl))
  end
end
