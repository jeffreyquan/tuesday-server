class Membership < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :project, :optional => true
  has_many :tasks, :through => :projects

  validates_uniqueness_of :email, :scope => :project_id 
end
