class AddMoreToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location, :string
    add_column :events, :date, :integer
    add_column :events, :start_time, :integer
    add_column :events, :end_time, :integer
  end
end
