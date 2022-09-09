# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times {
  User.create!(
    last_name: Faker::Name.unique.last_name,
    first_name: Faker::Name.unique.first_name,
    email: Faker::Internet.unique.email,
    password: "aaa",
    password_confirmation: "aaa",
    role: ["general", "admin"].sample
  )
}

20.times{|index|
  Board.create!(
    title: "タイトル#{index}",
    body: "本文#{index}",
    user: User.offset(rand(User.count)).first,
    topic: rand(5)
  )
} 
