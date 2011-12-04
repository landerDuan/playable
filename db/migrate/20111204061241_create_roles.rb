class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string  :name
      t.string  :code
      t.text    :description

      t.timestamps
    end
    
    add_index :roles, :code
    
    create_table :groups_roles, :id => false do |t|
      t.integer :group_id
      t.integer :role_id
    end
    
    add_index :groups_roles, :group_id
    add_index :groups_roles, :role_id
  end
end
