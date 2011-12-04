class AddIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, :defualt => false
    add_index :users, :is_admin
    
    User.update_all(:is_admin => false)
  end
end
