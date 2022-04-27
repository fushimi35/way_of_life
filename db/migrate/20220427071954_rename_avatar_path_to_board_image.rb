class RenameAvatarPathToBoardImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :boards, :avatar_path, :board_image
  end
end
