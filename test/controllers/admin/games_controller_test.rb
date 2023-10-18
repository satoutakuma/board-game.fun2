require "test_helper"

class Admin::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_games_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_games_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_games_destroy_url
    assert_response :success
  end
end
