class Answer < ApplicationRecord
  after_create :update_quiz_counts

  belongs_to :user
  belongs_to :quiz

  private

  def update_quiz_counts
    # 対象のクイズを取得
    quiz = self.quiz

    # 回答数をインクリメント
    quiz.increment!(:answer_count)

    # 正解の場合は正答数もインクリメント
    if self.option == quiz.correct_option
      quiz.increment!(:correct_count)
    end
  end
end
