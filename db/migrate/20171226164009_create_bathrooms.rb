class CreateBathrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :bathrooms do |t|
      t.integer :stalls
      t.string :title
      t.string :establishment
      t.string :address
      t.timestamps
    end
  end
end
