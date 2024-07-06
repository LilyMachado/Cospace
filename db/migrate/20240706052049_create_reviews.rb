class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.date :date

      t.timestamps
    end
  end
end
