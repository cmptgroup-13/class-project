class Bath < ActiveRecord::Base
  include ActiveModel::Model

  attr_accessor :country_code

end
