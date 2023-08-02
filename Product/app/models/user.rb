class User < ApplicationRecord
  has_many :points, dependent: :destroy
  has_many :quizzes, dependent: :destroy
end
