class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer   :user_id
      t.datetime  :checkin_at
      t.datetime  :checkout_at
      t.text      :description
      t.text      :feedback
      t.string    :type_identifier
      t.string    :state

      t.timestamps
    end
    
    add_index :events, :user_id
    add_index :events, :checkin_at
    add_index :events, :checkout_at
    add_index :events, :type_identifier
    add_index :events, :state
  end
end
