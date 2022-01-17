require "test_helper"

class BackofficeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_index_url
    assert_response :success
  end
end
