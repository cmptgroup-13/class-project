class CreateBathImages < ActiveRecord::Migration
  def change
    create_table :bath_images do |t|
      t.references :bath, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
