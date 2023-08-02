class QuizCategory < ApplicationRecord
  belongs_to :quiz
  belongs_to :category

  validates :quiz_id, presence: true
  validates :category_id, presence: true
end
