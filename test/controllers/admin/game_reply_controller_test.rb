require "test_helper"

class Admin::GameReplyControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_game_reply_destroy_url
    assert_response :success
  end
end
