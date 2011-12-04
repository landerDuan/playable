class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string  :name
      t.string  :code      
      t.text    :description

      t.timestamps
    end
    
    add_index :groups, :code
    
    create_table :groups_users, :id => false do |t|
      t.integer :group_id
      t.integer :user_id
    end
    
    add_index :groups_users, :group_id
    add_index :groups_users, :user_id
  end
end
