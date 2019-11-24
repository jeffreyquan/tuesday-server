class Project < ApplicationRecord
  has_many :groups
  has_many :tasks, :through => :groups
  has_many :memberships
  has_many :users, :through => :memberships
end
