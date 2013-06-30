class CreateBidMessages < ActiveRecord::Migration
  def change
    create_table :bid_messages do |t|
      t.references :user
      t.references :bid
      t.decimal :price, :pricision => 2, :scale => 20
      t.text :message
      t.boolean :accepted, :default => false
      t.timestamps
    end
  end
end
