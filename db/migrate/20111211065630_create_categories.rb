class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :code
      t.string  :name
      t.integer :posts_count, :default => 0

      t.timestamps
    end
    
    add_index :categories, :code
    add_index :categories, :name
    add_index :categories, :posts_count
  end
end
