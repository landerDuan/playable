class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string  :name_zh
      t.string  :name_en
      t.string  :name_jp
      t.string  :code
      t.text    :content_zh
      t.text    :content_en
      t.text    :content_jp
      t.string  :priority
      t.string  :position

      t.timestamps
    end
    
    add_index :pages, :code
    add_index :pages, :priority
    add_index :pages, :position
  end
end
