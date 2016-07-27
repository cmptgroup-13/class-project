class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :review, index: true, foreign_key: true, default: true
      t.references :user, index: true, foreign_key: true, default: true
      t.string :reason
      t.integer :count
      t.timestamps null: false
    end
    add_index :flags, [:user_id, :review_id], unique: true
  end
  
end
