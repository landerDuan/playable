class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :user_id
      t.datetime :checkin_at
      t.datetime :checkout_at
      t.text :description
      t.text :feedback
      t.string :type_identifier
      t.string :state

      t.timestamps
    end
  end
end
