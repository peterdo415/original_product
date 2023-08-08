class AnswersController < ApplicationController
  before_action :require_login
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @answer = @quiz.answers.new(answer_params)

    if @answer.save
      # ポイントを追加する処理
      add_points_to_user(@answer.user, @quiz.difficulty * 10)

      redirect_to quiz_path(@quiz), notice: "回答が送信されました。"
    else
      redirect_to quiz_path(@quiz, correct: @correct)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:option)
  end

  def add_points_to_user(user, points)
    user.points += points
    user.save
  end
end
