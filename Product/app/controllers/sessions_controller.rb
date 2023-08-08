class SessionsController < ApplicationController

  def login
    user = User.find_or_create_by(email: params[:email])
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました。"
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。"
  end

end
