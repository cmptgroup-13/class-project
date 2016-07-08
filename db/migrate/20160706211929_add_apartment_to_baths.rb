class AddApartmentToBaths < ActiveRecord::Migration
  def change
    add_column :baths, :apartment, :string
  end
end
