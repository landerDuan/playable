class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.string :date
      t.boolean :is_workday
      t.string :memo

      t.timestamps
    end
  end
end
