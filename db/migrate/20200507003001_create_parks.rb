class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :notes
      t.integer :visitor_id
      t.timestamps null: false
    end
  end
end
