class User < ApplicationRecord
  has_many :quizzes, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
