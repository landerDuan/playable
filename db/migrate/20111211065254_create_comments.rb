class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string  :name
      t.string  :email
      t.text    :content

      t.timestamps
    end

    add_index :comments, :post_id
  end
end