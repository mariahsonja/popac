class AddCountryIdToProfile < ActiveRecord::Migration[5.1]
  def up 
    rename_column :profiles, :country, :country_id
    change_column :profiles, :country_id, 'integer USING CAST(country_id AS integer)'
  end
    
  def down
    change_column :profiles, :country_id, :string 
    rename_column :profiles, :country_id, :country
  end
  
end

  
