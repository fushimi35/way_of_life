class CreateNows < ActiveRecord::Migration[5.2]
  def change
    create_table :nows do |t|
      t.references :user, foreign_key: true
      t.string :age
      t.string :job
      t.text :job_detail
      t.text :schedule
      t.string :company
      t.string :company_feature
      t.text :ability_for_become
      t.text :necesary_to_keep
      t.text :good_point
      t.text :hard_time
      t.text :to_overcome
      t.string :private_activity
      t.string :string
      t.text :time_ratio
      t.integer :life_score
      t.string :vision

      t.timestamps
    end
  end
end
