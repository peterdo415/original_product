class Answer < ApplicationRecord
  after_create :add_point

  belongs_to :user
  belongs_to :quiz

  private

  def add_point
    # ポイントの追加ロジックをここに記述する
    # 例：self.user.points.create(point: 10)
  end
end
