class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.text    :plan
      t.text    :goal
      t.text    :content
      t.integer :score

      t.timestamps
    end
    
    add_index :reports, :user_id
  end
end
