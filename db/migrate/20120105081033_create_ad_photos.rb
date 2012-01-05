class CreateAdPhotos < ActiveRecord::Migration
  def change
    create_table :ad_photos do |t|
      t.integer :ad_id
      t.string :photo

      t.timestamps
    end
  end
end
