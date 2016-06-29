class CreateBaths < ActiveRecord::Migration
  def change
    create_table :baths do |t|
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.time :hours
      t.integer :rating

      t.timestamps null: false
    end
  end
end
