class AddInterestIdToProfile < ActiveRecord::Migration[5.1]
  def up 
    rename_column :profiles, :interest, :interest_id
    change_column :profiles, :interest_id, 'integer USING CAST(country_id AS integer)'
  end
    
  def down
    change_column :profiles, :interest_id, :string 
    rename_column :profiles, :interest_id, :interest
    
  end
end
