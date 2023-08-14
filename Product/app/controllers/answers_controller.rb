class AnswersController < ApplicationController
  before_action :require_login

  def create
    @quiz = Quiz.find(params[:quiz_id])

    if params[:answer].nil? || params[:answer][:option].blank?
      redirect_to quiz_path(@quiz), notice: "選択肢を選択してください。"
      return
    end

    option = params[:answer][:option].to_i
    unless [1, 2, 3].include?(option)
      redirect_to quiz_path(@quiz), notice: "選択肢が無効です。"
      return
    end

    @answer = Answer.new(option: option, user: @current_user, quiz: @quiz)


    if @answer.option == @quiz.correct_option && user_answered_to_quiz?(@answer.user, @quiz)
      notice_message = "正解です。(正解済み)"
    elsif @answer.save
      if @answer.option == @quiz.correct_option && !@answer.answered_correctly
        add_points_to_user(@answer.user, calculate_point)
        notice_message = "正解です、ポイントが追加されました。"
      else
        notice_message = "不正解です。"
      end
    else
      error_message = @answer.errors.full_messages.join(", ")
      notice_message = "回答の送信に問題がありました: #{error_message}"
    end

    redirect_to quiz_path(@quiz), notice: notice_message
  end

  private

  def answer_params
    params.require(:answer).permit(:option, :user_id, :quiz_id)
  end

  def calculate_point
    @quiz.difficulty * 10
  end

  def add_points_to_user(user, point)
    user.update(point: user.point + point)
  end

  # ユーザーが問題に回答済みかどうか
  def user_answered_to_quiz?(user, quiz)
    user.answers.exists?(quiz_id: quiz.id)
  end
end
