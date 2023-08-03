class ChangeCloumnsDifficultyAddQuizzes < ActiveRecord::Migration[7.0]
  def change
    change_column :quizzes, :difficulty, :integer, default: 0
  end
end
