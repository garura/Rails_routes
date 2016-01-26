class Contact < ActiveRecord::Base
  validates :email, :name, :user_id, :presence => true

  validates :email, uniqueness: { scope: :user_id }


  belongs_to :owner,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'User'

  has_many :shared_contacts,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: 'SharedContact',
    dependent: :destroy


end
