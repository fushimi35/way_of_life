class ChangePrivacyDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :privacy, from: nil, to: "0"
  end
end
