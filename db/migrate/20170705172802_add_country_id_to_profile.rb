class AddCountryIdToProfile < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :country, :country_id
    change_column :profiles, :country_id, :integer 
  end
end
