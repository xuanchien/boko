class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :price
      t.string :content
      t.references :advert
      t.references :user
      t.timestamps
    end
  end
end
