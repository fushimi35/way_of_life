class ChangeCommentsBodyNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :body, false
  end
end
