class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.references :user, foreign_key: true
      t.string :category_college
      t.string :reason_college
      t.text :schedule
      t.string :major
      t.text :major_detail
      t.text :reason_major
      t.text :friends
      t.text :experience
      t.text :challenge
      t.text :difference_environment
      t.text :difference_habits
      t.text :reason_first_company

      t.timestamps
    end
  end
end
