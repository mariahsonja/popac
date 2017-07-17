class RemoveProfileIdFromConversations < ActiveRecord::Migration[5.1]
  def change
    remove_column :conversations, :profile_id
  end
end
