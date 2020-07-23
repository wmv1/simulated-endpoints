require 'test_helper'

class MockControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mock_index_url
    assert_response :success
  end

  test "should get show" do
    get mock_show_url
    assert_response :success
  end

  test "should get new" do
    get mock_new_url
    assert_response :success
  end

  test "should get edit" do
    get mock_edit_url
    assert_response :success
  end

end
