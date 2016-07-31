class AddAttachmentPhotoToBathImages < ActiveRecord::Migration
  def self.up
    change_table :bath_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :bath_images, :photo
  end
end
