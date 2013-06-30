class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :location
      t.float :original_price

      t.timestamps
    end
  end
end
