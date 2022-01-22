class HomeController < ApplicationController
  def index
    @jobs = Job.order(created_at: :desc)
  end

  def apply_job
    @candidate = Candidate.new
    @job = Job.find(params[:id])
  end
end
