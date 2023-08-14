class UsersController < ApplicationController
  # ログインしていない場合、特定のアクションを除いてログインページにリダイレクトする
  before_action :require_login, except: %i[new create show]

  def new
  end

  def create
  end

  # ダッシュボードページ
  def show
    @user = User.find(params[:id])
  end

  # プロフィール編集ページ
  def edit
    @user = User.find(params[:id])
  end

  # プロフィール更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  # アカウント削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'アカウントが削除されました。'
  end

  private

  # ユーザー登録時のStrong Parameters
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
