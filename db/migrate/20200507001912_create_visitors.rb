class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :city
      t.string :state
      t.timestamps null: false
    end
  end
end
