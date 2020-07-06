class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_avatar.attach(user_params[:user_avatar])

    if @user.save
      log_in(@user)
      flash[:success] = 'User successfully created.'
      redirect_to @user
    else
      flash[:danger] = 'There was an error while creating the user.'
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_avatar)
  end
end
