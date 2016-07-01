class AddLatitudeAndLongitudeToBaths < ActiveRecord::Migration
  def change
    add_column :baths, :latitude, :float
    add_column :baths, :longitude, :float
  end
end
