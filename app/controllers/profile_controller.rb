class ProfileController < ApplicationController
  before_action :require_login
  def index
    @candidate = Candidate.where(user_id: current_user.id).first
  end

  def job
    @candidate = Candidate.where(user_id: current_user.id).first
    @job = @candidate.job
  end

  def trainings
    @candidate = Candidate.where(user_id: current_user.id).first
    @trainings = @candidate.trainings
  end

  def experience
    @candidate = Candidate.where(user_id: current_user.id).first
  end
end
