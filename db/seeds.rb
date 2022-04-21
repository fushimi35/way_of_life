# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times {
  User.create!(
    last_name: Faker::Name.unique.last_name,
    first_name: Faker::Name.unique.first_name,
    email: Faker::Internet.unique.email,
    password: "aaa",
    password_confirmation: "aaa"
  )
}

20.times {
  Board.create!(
    title: Faker::BossaNova.artist,
    body: Faker::String.random,
    user: User.find(rand(1..5))
  )
} 
#10.times do |n|
#  Board.create!(
#    title: Faker::BossaNova.artist,
#    body: Faker::String.random,
#    user_id: n
#  )
#end 
