class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_id, :integer
    add_column :users, :profile_type, :string
  end
end
