class Project < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :tasks, :through => :groups
  has_many :memberships, dependent: :destroy
  has_many :users, :through => :memberships
end
