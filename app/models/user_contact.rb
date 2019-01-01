class UserContact < ApplicationRecord
  belongs_to :user,    class_name: 'User', foreign_key: 'user_id', optional: false
  validates_presence_of :created_by, :updated_by, :phone
end
