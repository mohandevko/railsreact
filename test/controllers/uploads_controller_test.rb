require 'test_helper'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get uploads_index_url
    assert_response :success
  end

  test "should get import" do
    get uploads_import_url
    assert_response :success
  end

end
