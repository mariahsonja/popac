class RemoveInterestIdFromProfiles < ActiveRecord::Migration[5.1]
  def up 
    remove_column :profiles, :interests
  end
    
  def down
    add_column :profiles, :interests, :string
  end
end
