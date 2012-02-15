class AddUserIdToWorkday < ActiveRecord::Migration
  def change
    add_column :workdays, :user_id, :integer
  end
end
