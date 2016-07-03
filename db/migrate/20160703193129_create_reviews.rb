class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :post
      t.references :user, foreign_key: true
      t.references :bath, foreign_key: true

      t.timestamps null: false
    end
    
    add_index :reviews, [:user_id, :bath_id, :created_at]
  end
end
