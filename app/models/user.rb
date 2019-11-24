class User < ApplicationRecord
  has_secure_password

  has_many :memberships
  has_many :projects, :through => :memberships

  validates :email, presence: true
  validates_uniqueness_of :email
end
