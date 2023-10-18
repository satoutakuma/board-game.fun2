require "test_helper"

class Admin::GameCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_game_comments_destroy_url
    assert_response :success
  end
end
