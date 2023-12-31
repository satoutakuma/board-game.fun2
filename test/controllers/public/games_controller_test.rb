require "test_helper"

class Public::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_games_new_url
    assert_response :success
  end

  test "should get create" do
    get public_games_create_url
    assert_response :success
  end

  test "should get index" do
    get public_games_index_url
    assert_response :success
  end

  test "should get show" do
    get public_games_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_games_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_games_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_games_destroy_url
    assert_response :success
  end
end
