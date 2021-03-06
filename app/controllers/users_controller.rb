class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # TODO: Add flash message
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params
        .require(:user)
        .permit(:username, :email, :password, :password_confirmation)
    end
end
