class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :url
      t.text    :description
      t.integer :priority,      :default => 0
      t.integer :photos_count,  :default => 0

      t.timestamps
    end
    
    add_index :products, :name
    add_index :products, :priority
  end
end
