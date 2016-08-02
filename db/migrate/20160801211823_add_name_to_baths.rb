class AddNameToBaths < ActiveRecord::Migration
  def change
    add_column :baths, :name, :string
  end
end
