class QuizzesController < ApplicationController
  before_action :require_login, except: [:show, :index, :search, :new]

  def index
    if params[:per_page] == '30'
      @quizzes = Quiz.page(params[:page]).per(30)
    else
      @quizzes = Quiz.page(params[:page]).per(10)
    end
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: "問題を作成しました。"
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
    @correct_rate = @quiz.correct_rate
  end

  def edit
    @quiz = current_user.quizzes.find(params[:id])
  end

  def update
    @quiz = current_user.quizzes.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: "問題を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @quiz = current_user.quizzes.find(params[:id])
    @quiz.destroy
    redirect_to edit_user_path, notice: "問題を削除しました。"
  end

  # モデルに定義するべき？
  def search
    # 検索フォームで入力されたキーワードを取得
    keyword = params[:search]

    # 問題を検索する処理（例として問題文にキーワードが含まれる問題を検索）
    @quizzes = Quiz.where('problem_statement LIKE ?', "%#{keyword}%").page(params[:page]).per(params[:per_page] || 10)

    render :index
  end

  private

  def quiz_params
    params.require(:quiz).permit(:problem_statement, :first_option, :second_option, :third_option, :correct_option)
  end

end
