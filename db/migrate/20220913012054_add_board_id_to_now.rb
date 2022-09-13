class AddBoardIdToNow < ActiveRecord::Migration[5.2]
  def change
    add_reference :nows, :board, foreign_key: true
  end
end
