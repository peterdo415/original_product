# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ユーザー作成
10.times do
  User.create(name: Faker::Name.unique.name)
end

# カテゴリ作成
categories = %w[Science History Geography]

categories.each do |category|
  Category.create(name: category)
end

# 問題作成
User.all.each do |user|
  10.times do
    quiz = user.quizzes.create(
      difficulty: rand(0..100),
      problem_statement: Faker::Lorem.sentence,
      first_option: Faker::Lorem.word,
      second_option: Faker::Lorem.word,
      third_option: Faker::Lorem.word,
      correct_option: rand(1..3)
    )
    quiz.categories << Category.all.sample(2)
  end
end

