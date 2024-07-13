class CreateWorkspaces < ActiveRecord::Migration[6.1]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.string :location
      t.datetime :available_from
      t.datetime :available_to
      t.text :amenities

      t.timestamps
    end
  end
end
