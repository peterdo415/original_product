class AddAnsweredCorrectlyToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :answered_correctly, :boolean, default: false
  end
end
