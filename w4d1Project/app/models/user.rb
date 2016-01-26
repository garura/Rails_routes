class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :original_contacts,
  class_name: 'Contact',
  foreign_key: :user_id,
  primary_key: :id,
  dependent: :destroy

  has_many :shared_contacts,
  class_name: 'SharedContact',
  foreign_key: :user_id,
  primary_key: :id,
  dependent: :destroy


end
