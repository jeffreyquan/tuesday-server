class User < ApplicationRecord
  has_many :memberships
  has_many :projects, :through => :memberships
  has_secure_password

  validates :name, :email, presence: true
  validates_uniqueness_of :email
end
