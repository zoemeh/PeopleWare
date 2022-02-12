class TrainingsController < ApplicationController
  before_action :set_training, only: %i[ show edit update destroy ]
  before_action :require_login

  # GET /trainings or /trainings.json
  def index
    @trainings = Training.all
  end

  # GET /trainings/1 or /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings or /trainings.json
  def create
    @training = Training.new(training_params)
    @candidate = Candidate.find_by_user_id(current_user.id)
    @training.candidate = @candidate
    respond_to do |format|
      if @training.save
        format.html { 
          if current_user.group == "admins"
            redirect_to trainings_url, notice: "Training was successfully created." 
          else
            redirect_to profile_trainings_url, notice: "Training was successfully created." 
          end
          }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1 or /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { 
          if current_user.group == "admins"
            redirect_to trainings_url
          else
            redirect_to profile_trainings_url
          end
          }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1 or /trainings/1.json
  def destroy
    candidate = @training.candidate
    @training.destroy

    respond_to do |format|
      format.html { redirect_to candidate, notice: "Training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:description, :level, :from_at, :to_at, :institution)
    end
end
