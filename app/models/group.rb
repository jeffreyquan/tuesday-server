class Group < ApplicationRecord
  belongs_to :project, :optional => true
  has_many :tasks, dependent: :destroy
end
