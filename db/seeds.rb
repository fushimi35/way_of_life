# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

#Userの生成
# CSV.foreach('db/seeds/user.csv', headers: true) do |row|
#   User.create(
#     last_name: row['last_name'],
#     first_name: row['first_name'],
#     nickname: row['nickname'],
#     highschool_name: row['highschool_name'],
#     privacy: row['privacy'],
#     email: row['email'],
#     password: "aaa",
#     password_confirmation: "aaa",
#     role: "general"
#   )
# end

  #Boardの生成
# CSV.foreach('db/seeds/board.csv', headers: true) do |row|
#   Board.create(
#     user_id: row['user_id'],
#     title: row['title'],
#     topic: row['topic'],
#     body: row['body']
#   )
# end

#Nowの生成
# CSV.foreach('db/seeds/now.csv', headers: true) do |row|
#   Now.create(
#     user_id: row['user_id'],
#     age: row['age'],
#     job: row['job'],
#     job_detail: row['job_detail'],
#     schedule: row['schedule'],
#     company: row['company'],
#     company_feature: row['company_feature'],
#     ability_for_become: row['ability_for_become'],
#     necesary_to_keep: row['necesary_to_keep'],
#     good_point: row['good_point'],
#     hard_time: row['hard_time'],
#     to_overcome: row['to_overcome'],
#     private_activity: row['private_activity'],
#     time_ratio: row['time_ratio'],
#     life_score: row['life_score'],
#     vision: row['vision']
#   )
# end


#Highschoolの生成
# CSV.foreach('db/seeds/highschool.csv', headers: true) do |row|
#   Highschool.create(
#     user_id: row['user_id'],
#     character: row['character'],
#     good_at: row['good_at'],
#     bad_at: row['bad_at'],
#     friends: row['friends'],
#     feature_school: row['feature_school'],
#     time_ratio: row['time_ratio'],
#     grades: row['grades'],
#     subject_choice: row['subject_choice'],
#     reason_subject_choice: row['reason_subject_choice'],
#     club_activities: row['club_activities'],
#     hobby: row['hobby'],
#     dream: row['dream'],
#     if_high_school_again: row['if_high_school_again']
#   )
# end

#Collegeの生成
# CSV.foreach('db/seeds/college.csv', headers: true) do |row|
#   College.create(
#     user_id: row['user_id'],
#     category_college: row['category_college'],
#     reason_college: row['reason_college'],
#     schedule: row['schedule'],
#     major: row['major'],
#     major_detail: row['major_detail'],
#     reason_major: row['reason_major'],
#     friends: row['friends'],
#     experience: row['experience'],
#     challenge: row['challenge'],
#     difference_environment: row['difference_environment'],
#     difference_habits: row['difference_habits'],
#     reason_first_company: row['reason_first_company']
#   )
# end

#Societyの生成
# CSV.foreach('db/seeds/society.csv', headers: true) do |row|
#   Society.create(
#     user_id: row['user_id'],
#     past_jobs: row['past_jobs'],
#     background: row['background'],
#     turning_point: row['turning_point']
#   )
# end

#高校データのインポート
CSV.foreach('db/seeds/highschool_names.csv', headers: true) do |row|
  HighschoolName.create(
    highschool: row['highschool_name']
  )
end


# 20.times {
#   User.create!(
#     last_name: Faker::Name.unique.last_name,
#     first_name: Faker::Name.unique.first_name,
#     email: Faker::Internet.unique.email,
#     password: "aaa",
#     password_confirmation: "aaa",
#     role: ["general", "admin"].sample
#   )
# }

# 20.times{|index|
#   Board.create!(
#     title: "タイトル#{index}",
#     body: "本文#{index}",
#     user: User.offset(rand(User.count)).first,
#     topic: rand(5)
#   )
# } 
