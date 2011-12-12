class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :permalink
      t.boolean :is_top
      t.integer :category_id

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :title
    add_index :posts, :category_id
  end
end
