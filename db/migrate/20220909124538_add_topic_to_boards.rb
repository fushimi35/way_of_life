class AddTopicToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :topic, :integer
  end
end
