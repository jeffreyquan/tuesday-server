class User < ApplicationRecord
  has_secure_password

  has_many :memberships, dependent: :destroy
  has_many :projects, :through => :memberships

  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :length => { :minimum => 5 }
end
