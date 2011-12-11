class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.integer :product_id
      t.string  :photo

      t.timestamps
    end
    
    add_index :product_photos, :product_id
  end
end
