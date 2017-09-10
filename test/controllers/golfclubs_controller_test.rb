require 'test_helper'

class GolfclubsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get golfclubs_index_url
    assert_response :success
  end

  test "should get show" do
    get golfclubs_show_url
    assert_response :success
  end

end
