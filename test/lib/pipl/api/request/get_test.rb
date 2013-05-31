require "helper"

class TestPiplAPIRequestGet < Minitest::Test
  def setup
    @get = Pipl::API::Request::Get.new("http://www.foo.com/var")
  end

  def test_call!
    expected = "http://www.foo.com/var"
    RestClient.stub :get, "http://www.foo.com/var" do
      actual = @get.call!
      assert_equal(expected, actual)
    end
  end
end
