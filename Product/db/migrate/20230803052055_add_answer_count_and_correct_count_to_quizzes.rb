class AddAnswerCountAndCorrectCountToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :answer_count, :integer, default: 0
    add_column :quizzes, :correct_count, :integer, default: 0
  end
end
