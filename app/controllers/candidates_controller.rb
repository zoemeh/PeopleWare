
class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]


  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.order(created_at: :desc).search(params["buscar"])
    @buscar = params[:buscar]
  end

  def advance_search
    @buscar = params[:buscar]
    @candidates = Candidate.search(params["buscar"])
    @skills = params[:skills]
    @languages = params[:languages]
    @trainings = params[:trainings]
    @job = params[:job]
    unless params[:languages].nil?
      @candidates = @candidates.joins(:languages).where("languages.id": params[:languages])
    end
    unless params[:skills].nil?
      @candidates = @candidates.joins(:skills).where("skills.id": params[:skills])
    end
    unless @trainings.nil?
      @candidates = @candidates.joins(:trainings).where("trainings.level": params[:trainings])
    end
    unless @job.nil? || @job == "0"
      @candidates = @candidates.where(job_id: @job)
    end
    @candidates = @candidates.uniq
  end

  # GET /candidates/1 or /candidates/1.json
  def show
    if (@candidate.employee.nil?)
      @employee = Employee.new
    else
      @employee = @candidate.employee
    end
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates or /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)
    binding.pry
    respond_to do |format|
      if @candidate.save
        @candidate.trainings.each {|x| x.validate }
        if (!signed_in?)
          sign_in(@candidate.user)
        end
        format.html { 
          if current_user.group == "admins"
            redirect_to candidate_url(@candidate) 
          else
            redirect_to profile_index_url 
          end
        }
        format.json { render :show, status: :created, location: @candidate }
      else
        @candidate.trainings.each {|x| x.validate }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
      @candidate.trainings.each {|x| x.validate }
      if @candidate.update(candidate_params)
        format.html { 
          if current_user.group == "admins"
          redirect_to candidate_url(@candidate), notice: "Candidado actualizado" 
          else
          redirect_to profile_index_path, notice: "Candidado actualizado"
          end
        }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:cedula, :name, :job_id, :desired_wage, :recommended_by, 
        experience: [:company, :job, :to, :from, :wage], 
        trainings_attributes: [:id, :description, :level, :institution, :from_at, :to_at],
        skill_ids: [],
        language_ids: [])
    end
end
