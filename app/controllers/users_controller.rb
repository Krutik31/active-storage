class UsersController < ApplicationController
  before_action :fetch_user, only: %i[update destroy edit show]

  def index
    @users = User.all.order(id: :asc)
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def fetch_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :phonenumber, :avatar)
  end
end
