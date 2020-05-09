class AddDateToParks < ActiveRecord::Migration
  def change
    add_column :parks, :date_visited, :string
  end
end
