class CreateWorkspaces < ActiveRecord::Migration[6.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price, precision: 10, scale: 2
      t.string :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
