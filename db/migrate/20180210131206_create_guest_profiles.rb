class CreateGuestProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :guest_profiles do |t|

      t.timestamps
    end
  end
end
