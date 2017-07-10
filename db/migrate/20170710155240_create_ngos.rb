class CreateNgos < ActiveRecord::Migration[5.1]
  def change
    create_table :ngos do |t|
      t.string :name
      t.text :bio
      t.string :image_url
      t.string :interest

      t.timestamps
    end
  end
end
