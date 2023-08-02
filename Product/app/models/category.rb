class Category < ApplicationRecord
  has_many :quiz_categories, dependent: :destroy
  has_many :quizzes, through: :quiz_categories

  validates :name, presence: true, uniqueness: true
end
