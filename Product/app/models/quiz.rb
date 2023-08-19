class Quiz < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :quiz_categories, dependent: :destroy
  has_many :categories, through: :quiz_categories

  validates :difficulty, presence: true
  validates :problem_statement, presence: true
  validates :first_option, presence: true
  validates :second_option, presence: true
  validates :third_option, presence: true
  validates :correct_option, presence: true, inclusion: { in: [1, 2, 3] }

  def correct_rate
    return 0 if answer_count == 0

    (correct_count.to_f / answer_count * 100).round(2)
  end

  # 正答率による難易度設定
  def set_difficulty
    # 正答率を計算
    accuracy = correct_rate

    # 正答率に応じて難易度を設定
    case accuracy
    when 80..100
      1
    when 60...80
      2
    when 40...60
      3
    when 20...40
      4
    else
      5
    end
  end
end
