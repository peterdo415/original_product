class QuizzesController < ApplicationController
  #before_action :require_login, except: [:show, :index, :search, :new]

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
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: "問題を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to edit_user_path, notice: "問題を削除しました。"
  end

  # モデルに定義するべき？
  def search
    keyword = params[:search]
    category = params[:category]

    @quizzes = Quiz.joins(:categories)

    # 問題文とカテゴリー名の部分一致検索
    if keyword.present? && category.present?
      @quizzes = @quizzes.where('problem_statement LIKE ? OR categories.name LIKE ?', "%#{keyword}%", "%#{category}%")
    elsif keyword.present?
      @quizzes = @quizzes.where('problem_statement LIKE ?', "%#{keyword}%")
    elsif category.present?
      @quizzes = @quizzes.where('categories.name LIKE ?', "%#{category}%")
    end

    render :index
  end

  private

  def quiz_params
    params.require(:quiz).permit(:problem_statement, :first_option, :second_option, :third_option, :correct_option)
  end

end
