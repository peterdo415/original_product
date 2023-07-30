class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.integer :difficulty, null: false
      t.text :problem_statement, null: false
      t.text :first_option, null: false
      t.text :second_option, null: false
      t.text :third_option, null: false
      t.integer :correct_option, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
