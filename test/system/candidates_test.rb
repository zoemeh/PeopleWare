require "application_system_test_case"

class CandidatesTest < ApplicationSystemTestCase
  setup do
    @candidate = candidates(:one)
  end

  test "visiting the index" do
    visit candidates_url
    assert_selector "h1", text: "Candidates"
  end

  test "should create candidate" do
    visit candidates_url
    click_on "New candidate"

    fill_in "Cedula", with: @candidate.cedula
    fill_in "Desired wage", with: @candidate.desired_wage
    fill_in "Job", with: @candidate.job_id
    fill_in "Name", with: @candidate.name
    fill_in "Recommended by", with: @candidate.recommended_by
    click_on "Create Candidate"

    assert_text "Candidate was successfully created"
    click_on "Back"
  end

  test "should update Candidate" do
    visit candidate_url(@candidate)
    click_on "Edit this candidate", match: :first

    fill_in "Cedula", with: @candidate.cedula
    fill_in "Desired wage", with: @candidate.desired_wage
    fill_in "Job", with: @candidate.job_id
    fill_in "Name", with: @candidate.name
    fill_in "Recommended by", with: @candidate.recommended_by
    click_on "Update Candidate"

    assert_text "Candidate was successfully updated"
    click_on "Back"
  end

  test "should destroy Candidate" do
    visit candidate_url(@candidate)
    click_on "Destroy this candidate", match: :first

    assert_text "Candidate was successfully destroyed"
  end
end
