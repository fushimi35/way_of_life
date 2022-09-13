class CreateSocieties < ActiveRecord::Migration[5.2]
  def change
    create_table :societies do |t|
      t.references :user, foreign_key: true
      t.text :past_jobs
      t.text :background
      t.text :turning_point

      t.timestamps
    end
  end
end
