class SessionsController < ApplicationController
  def new; end

  def home; end

  def create
    user = User.find_by(name: session_params[:name])
    if user
      log_in(user)
      flash[:success] = 'You have successfully logged in.'
      redirect_to user
    else
      flash.now[:danger] = 'You could not log in. Invalid name.'
      render 'new'
    end
  end

  def destroy
    log_out
    if session[:user_id].nil?
      flash.now[:success] = 'You have successfully logged out.'
      render 'home'
    else
      flash[:danger] = 'There was an error while loggin out.'
      session_redirect
    end
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
