require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_index_url
    assert_response :success
  end

  test "should get new_employees" do
    get reports_new_employees_url
    assert_response :success
  end

  test "should get candidates" do
    get reports_candidates_url
    assert_response :success
  end
end
