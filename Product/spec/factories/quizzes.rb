FactoryBot.define do
  require 'faker'

  factory :quiz do
    difficulty { rand(1..5) }
    problem_statement { Faker::Lorem.sentence }
    first_option { Faker::Lorem.word }
    second_option { Faker::Lorem.word }
    third_option { Faker::Lorem.word }
    correct_option { rand(1..3) }
    association :user, factory: :user

    after(:create) do |quiz|
      # ランダムな数のタグを作成し、関連付ける
      rand(1..5).times do
        quiz.categories << FactoryBot.create(:category)
      end
    end
  end
end