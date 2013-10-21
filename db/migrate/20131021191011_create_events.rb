class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
       t.string :title
       t.integer :severity
       t.text :description 
    end
  end
end
