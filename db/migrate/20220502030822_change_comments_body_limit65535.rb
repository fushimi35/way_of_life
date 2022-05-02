class ChangeCommentsBodyLimit65535 < ActiveRecord::Migration[5.2]
  def up 
    change_column :comments, :body, :text, limit: 65535
  end
  def down 
    change_column :comments, :body, :text
  end
end
