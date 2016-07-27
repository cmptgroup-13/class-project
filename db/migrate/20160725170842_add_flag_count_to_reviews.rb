class AddFlagCountToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :flag_count, :integer
  end
end
