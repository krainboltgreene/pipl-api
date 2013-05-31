require "helper"

class TestPiplAPIRequest < Minitest::Test
  def setup
    @request = Pipl::API::Request.new("foo")
  end

  def test_host
    expected = "api.pipl.com"
    actual = Pipl::API::Request::HOST
    assert_equal(expected, actual)
  end

  def test_protocol
    expected = "http://"
    actual = @request.protocol
    assert_equal(expected, actual)

    expected = "https://"
    actual = Pipl::API::Request.new("foo", nil, true).protocol
    assert_equal(expected, actual)
  end

  def test_version
    expected = "v2"
    actual = @request.version
    assert_equal(expected, actual)
    expected = "v4"
    actual = Pipl::API::Request.new("foo", nil, nil, "v4").version
    assert_equal(expected, actual)
  end

  def test_uri
    expected = "http://api.pipl.com/foo/v2/json"
    actual = @request.uri
    assert_equal(expected, actual)
  end

  def test_call
    get = MiniTest::Mock.new
    get.expect :call!, "foo", [{}]
    Pipl::API::Request::Get.stub :new, get do
      expected = "foo"
      actual = @request.call("get")
      assert_equal(expected, actual)
    end
  end
end
