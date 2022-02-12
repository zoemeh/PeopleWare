class UsersController < Clearance::UsersController
  skip_before_action :redirect_signed_in_users, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.where(group: "admins")
  end

  def create
    @user = user_from_params
    @user.group = "admins"
    if @user.save
      #sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(params.require(:user).permit(:email, :password))
        format.html { redirect_to users_path }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path}
      format.json { head :no_content }
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end