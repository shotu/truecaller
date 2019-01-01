class User < ApplicationRecord
  validates_presence_of :email, :phone, :created_by, :updated_by

end
