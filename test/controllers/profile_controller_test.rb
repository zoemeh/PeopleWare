require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_index_url
    assert_response :success
  end

  test "should get job" do
    get profile_job_url
    assert_response :success
  end

  test "should get trainings" do
    get profile_trainings_url
    assert_response :success
  end

  test "should get experience" do
    get profile_experience_url
    assert_response :success
  end
end
