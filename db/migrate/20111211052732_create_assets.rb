class CreateAssets < ActiveRecord::Migration

  def change
    create_table :assets do |t|
      t.string  :asset
      t.integer :file_size
      t.string  :file_type

      t.timestamps
    end
  end

end

