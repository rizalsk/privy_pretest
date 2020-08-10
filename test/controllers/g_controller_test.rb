require 'test_helper'

class GControllerTest < ActionDispatch::IntegrationTest
  test "should get pages" do
    get g_pages_url
    assert_response :success
  end

  test "should get index" do
    get g_index_url
    assert_response :success
  end

end
