class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string  :title
      t.string  :permalink
      t.text    :content
      
      t.timestamps
    end
    
    add_index :posts, :user_id
    add_index :posts, :title
    add_index :posts, :permalink
  end
end
