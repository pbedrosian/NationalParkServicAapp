class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :notes
      t.string :date_visited
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
