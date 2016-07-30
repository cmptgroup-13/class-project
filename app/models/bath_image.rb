class BathImage < ActiveRecord::Base
    belongs_to :bath
    belongs_to :user
    has_attached_file :photo, styles: { large: "600x600>", thumb: "150x150#" }
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    validates_attachment_size :photo, :less_than => 5.megabytes
end
