class User < ApplicationRecord
  has_many :teams
  has_many :projects, :through => :teams
  has_secure_password

  validates :name, :email, presence: true
  validates_uniqueness_of :email
end
