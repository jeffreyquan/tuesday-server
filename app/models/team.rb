class Team < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :tasks, :through => :projects
end
