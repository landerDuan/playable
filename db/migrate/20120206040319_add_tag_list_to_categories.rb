class AddTagListToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :tag_list, :string
  end
end
