class Project < ApplicationRecord
  has_many :tasks
  has_many :memberships
  has_many :users, :through => :memberships
end
