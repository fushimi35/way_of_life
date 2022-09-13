class ChangeBoardBodyNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :boards, :body, true
  end

  def down
    change_column_null :boards, :body, false
  end
end
