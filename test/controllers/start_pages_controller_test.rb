require 'test_helper'

class StartPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get start_pages_top_url
    assert_response :success
  end

end
