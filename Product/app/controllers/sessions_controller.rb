class SessionsController < ApplicationController
  before_action :require_login, except: %i[new login logout]
  # ログインページ
  def new
  end

  # ログイン処理
  def login
    # Google連携の処理を追加する
    # 例えば、Googleのアクセストークンを取得してユーザー情報を認証する処理を行う

    # ユーザー情報を元に、ログイン処理を行う（仮のコード）
    @user = User.find_by(email: 'example@example.com') # Googleから取得したメールアドレスを元にユーザーを検索
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      redirect_to login_path, alert: 'ログインに失敗しました。'
    end
  end

  # ログアウト
  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました。'
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
end
