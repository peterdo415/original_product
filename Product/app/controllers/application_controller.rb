class ApplicationController < ActionController::Base
  #before_action :require_login

  private

  def require_login
    unless @current_user
      flash[:alert] = "ログインしてください"
      redirect_to login_path
    end
  end
end
