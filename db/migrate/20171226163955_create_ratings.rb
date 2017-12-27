class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.datetime :review_date
      t.string :description
      t.integer :stars
      t.integer :bathroom_id
      t.timestamps
    end
  end
end
