
class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]


  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.search(params["buscar"])
    @buscar = params[:buscar]
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
    respond_to do |format|
      if @candidate.save
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
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
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
