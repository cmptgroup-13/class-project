class AddAttachmentImageToBaths < ActiveRecord::Migration
  def self.up
    change_table :baths do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :baths, :image
  end
end
