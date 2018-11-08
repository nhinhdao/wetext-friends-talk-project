require 'test_helper'

class ConnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get connections_index_url
    assert_response :success
  end

  test "should get new" do
    get connections_new_url
    assert_response :success
  end

  test "should get create" do
    get connections_create_url
    assert_response :success
  end

  test "should get update" do
    get connections_update_url
    assert_response :success
  end

  test "should get destroy" do
    get connections_destroy_url
    assert_response :success
  end

end
