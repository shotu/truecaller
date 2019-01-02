class UserContactCallHistory < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: false
  belongs_to :user_contact, class_name: 'UserContact', foreign_key: 'user_contact_id', optional: false
  validates_presence_of :created_by, :updated_by, :user_contact_id, :user_id
end
