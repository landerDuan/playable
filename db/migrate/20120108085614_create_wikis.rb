class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :name
      t.string :url
      t.integer :priority,      :default => 0

      t.timestamps
    end

    add_index :wikis, :name
    add_index :wikis, :priority
  end
end
