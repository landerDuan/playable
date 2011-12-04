class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer   :user_id
      t.datetime  :checkin_at
      t.datetime  :checkout_at
      t.text      :description
      t.text      :feedback
      t.string    :type_identifier
      t.string    :state

      t.timestamps
    end
    
    add_index :marks, :user_id
    add_index :marks, :checkin_at
    add_index :marks, :checkout_at
    add_index :marks, :type_identifier
    add_index :marks, :state
  end
end
