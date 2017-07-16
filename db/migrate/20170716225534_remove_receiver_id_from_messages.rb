class RemoveReceiverIdFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :receiver_id
  end
end
