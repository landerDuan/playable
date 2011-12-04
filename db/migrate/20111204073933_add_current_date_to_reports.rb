class AddCurrentDateToReports < ActiveRecord::Migration
  def change
    add_column :reports, :current_date, :datetime
  end
end
