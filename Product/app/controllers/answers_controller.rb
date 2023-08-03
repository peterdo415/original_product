class AnswersController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    selected_option = params[:quiz][:option].to_i

    # 回答を作成
    @answer = Answer.new(quiz: @quiz, user: current_user, option: selected_option)
    @answer.save

    # 正解か不正解かを判定
    @correct = @quiz.correct_option == selected_option

    @quiz.set_difficulty if @quiz.answer_count > 10

    # 正解時にのみポイントを加算
    add_point if @correct

    # 問題詳細ページにリダイレクトして正解か不正解を表示
    redirect_to quiz_path(@quiz, correct: @correct)
  end
end
