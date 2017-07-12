class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
       t.integer :sender_id, index: true
       t.integer :receiver_id, index: true
       t.string :content
       t.timestamps
    end
  end
end
