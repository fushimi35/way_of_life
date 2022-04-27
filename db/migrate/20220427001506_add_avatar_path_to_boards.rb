class AddAvatarPathToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :avatar_path, :string
  end
end
