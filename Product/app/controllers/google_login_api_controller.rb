class GoogleLoginApiController < ApplicationController
  require 'googleauth/id_tokens/verifier'

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token

  def callback
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: '665242331319-60h6339l3bp22eo1pqg3645p18ttu37p.apps.googleusercontent.com')
    # emailのみで検索
    user = User.find_by(email: payload['email'])

    if user
      login(user)
      redirect_to quizzes_path, notice: 'ログインしました'
    else
      user = User.create(email: payload['email'], name: payload['name'])
      login(user)
      redirect_to quizzes_path, notice: '登録しました'
    end
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to login_path, notice: '不正なアクセスです'
    end
  end

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end
end