class CreateInterestsProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :interests_profiles do |t|
      t.belongs_to :interest, index: true
      t.belongs_to :profile, index: true
    end
  end
end
