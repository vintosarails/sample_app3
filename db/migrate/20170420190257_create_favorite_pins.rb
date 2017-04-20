class CreateFavoritePins < ActiveRecord::Migration
  def change
    create_table :favorite_pins do |t|
      t.integer :pin_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
