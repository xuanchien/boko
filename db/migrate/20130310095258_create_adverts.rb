class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.references :user
      t.string :title
      t.string :description
      t.decimal :original_price
      t.timestamps
    end
  end
end
