class ReChangeCloumnsDifficultyAddQuizzes < ActiveRecord::Migration[7.0]
  def change
    change_column :quizzes, :difficulty, :integer, default: 3
  end
end
