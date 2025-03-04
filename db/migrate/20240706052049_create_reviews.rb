class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :workspace, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
