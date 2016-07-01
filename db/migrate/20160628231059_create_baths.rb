class CreateBaths < ActiveRecord::Migration
  def change
    create_table :baths do |t|
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.time :hours
      t.integer :rating
      t.references :user, foreign_key: true


      t.timestamps null: false
    end
    add_index :baths, [:user_id, :created_at]
  end
end
