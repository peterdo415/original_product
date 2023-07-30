class UsersController < ApplicationController
  # ログインしていない場合、特定のアクションを除いてログインページにリダイレクトする
  before_action :require_login, except: %i[new create]

  # 登録ページ
  def new
  end

  # 登録
  def create

  end

  # ダッシュボードページ
  def show
    @user = @current_user
  end

  # プロフィール編集ページ
  def edit
    @user = @current_user
  end

  # プロフィール更新
  def update
    @user = @current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  # アカウント削除
  def destroy
    @user = @current_user
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'アカウントが削除されました。'
  end

  private

  # ユーザー登録時のStrong Parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
