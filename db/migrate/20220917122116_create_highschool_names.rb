class CreateHighschoolNames < ActiveRecord::Migration[5.2]
  def change
    create_table :highschool_names do |t|
      t.string :highschool

      t.timestamps
    end
  end
end
