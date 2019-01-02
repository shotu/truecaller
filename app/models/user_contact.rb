class UserContact < ApplicationRecord

  belongs_to :user,    class_name: 'User', foreign_key: 'user_id', optional: false
  validates_presence_of :created_by, :updated_by, :phone

  def as_json
    super( only: %i[ id name email phone])
  end
end
