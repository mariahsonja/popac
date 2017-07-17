class CreateConversationsProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations_profiles do |t|
      t.belongs_to :conversation, index: true
      t.belongs_to :profile, index: true
    end
  end
end
