class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :privacy, :integer, null: false
    add_column :users, :highschool_name, :string, limit:30
    add_column :users, :nickname, :string, null: false, limit:30
  end
end
