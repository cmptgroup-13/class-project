class CreateBaths < ActiveRecord::Migration
  def change
    create_table :baths do |t|
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.time :hours
      t.boolean :admin_accept
      t.references :user, foreign_key: true
      # t.text :smell
      # t.text :wait_time
      # t.text :comfort
      # # t.text :review
      

      t.timestamps null: false
    end
    add_index :baths, [:user_id, :created_at]
  end
end
