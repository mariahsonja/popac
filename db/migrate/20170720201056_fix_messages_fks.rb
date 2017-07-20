class FixMessagesFks < ActiveRecord::Migration[5.1]
  def up
    remove_foreign_key :messages, column: :sender_id
    add_foreign_key :messages, :profiles, column: :sender_id
  end
  
  def down
    remove_foreign_key :messages, column: :sender_id
    add_foreign_key :messages, :users, column: :sender_id
  end
end
