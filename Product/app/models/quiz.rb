class Quiz < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :quiz_categories, dependent: :destroy
  has_many :categories, through: :quiz_categories

  validates :difficulty, presence: true
  validates :problem_statement, presence: true
  validates :first_option, presence: true
  validates :second_option, presence: true
  validates :third_option, presence: true
  validates :correct_option, presence: true, inclusion: { in: [1, 2, 3] }
end
