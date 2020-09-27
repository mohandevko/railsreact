require 'test_helper'

class V1::MappingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_mappings_index_url
    assert_response :success
  end

end
