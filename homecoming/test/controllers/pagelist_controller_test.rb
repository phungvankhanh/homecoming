require 'test_helper'

class PagelistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pagelist_index_url
    assert_response :success
  end

end
