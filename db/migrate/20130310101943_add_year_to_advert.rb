class AddYearToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :year, :integer
  end
end
