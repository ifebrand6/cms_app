require 'test_helper'

class AdminUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_user_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_user_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_user_delete_url
    assert_response :success
  end

end
