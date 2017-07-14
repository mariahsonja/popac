class AddConversationIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :conversation_id, :integer
    add_index :messages, :conversation_id
    add_foreign_key :messages, :conversations, column: :conversation_id
  end
end
