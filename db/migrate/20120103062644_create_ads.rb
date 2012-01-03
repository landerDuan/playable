class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :url
      t.string :photo
      t.string :position

      t.timestamps
    end
  end
end
