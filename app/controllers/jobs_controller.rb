class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy candidates select_candidate selection_process ]
  before_action :require_login

  # GET /jobs or /jobs.json
  def index
    @jobs = Job.all
  end

  def fulfilled
    @jobs = Job.where.not(candidate: nil)
    render :index
  end

  def unfulfilled
    @jobs = Job.where(candidate: nil)
    render :index
  end

  def selection_process

  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  def candidates

  end

  def select_candidate
    @candidate = Candidate.find(params[:candidate_id])
    @job.select_candidate(@candidate, params[:wage])
    redirect_to @job
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:name, :risk_level, :wage_min, :wage_max, :status)
    end
end
