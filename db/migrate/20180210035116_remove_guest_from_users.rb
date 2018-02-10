class RemoveGuestFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :guest, :bollean, default: false, null: false 
  end
end
