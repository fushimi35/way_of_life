class CreateHighschools < ActiveRecord::Migration[5.2]
  def change
    create_table :highschools do |t|
      t.references :user, foreign_key: true
      t.string :character
      t.text :good_at
      t.text :bad_at
      t.text :friends
      t.text :feature_school
      t.text :time_ratio
      t.text :grades
      t.text :subject_choice
      t.text :reason_subject_choice
      t.text :club_activities
      t.text :hobby
      t.text :dream
      t.text :if_high_school_again

      t.timestamps
    end
  end
end
