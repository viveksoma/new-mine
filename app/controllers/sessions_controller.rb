class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to projects_path
    end
  end

  def create
    user = User.find_by(id: params[:session][:user_id])
    pp current_user
    pp user
    if user
      log_in user
      redirect_to projects_path
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
