class AddMarkContentToReport < ActiveRecord::Migration
  def change
    add_column :reports, :mark_content, :text
  end
end
