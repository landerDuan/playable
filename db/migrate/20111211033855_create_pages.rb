class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string  :name
      t.string  :code
      t.text    :content
      t.string  :priority
      t.string  :position

      t.timestamps
    end
    
    add_index :pages, :code
    add_index :pages, :priority
    add_index :pages, :position
  end
end
