require 'test_helper'

class GratemansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gratemans_new_url
    assert_response :success
  end

  test "should get index" do
    get gratemans_index_url
    assert_response :success
  end

  test "should get show" do
    get gratemans_show_url
    assert_response :success
  end

  test "should get edit" do
    get gratemans_edit_url
    assert_response :success
  end

end
