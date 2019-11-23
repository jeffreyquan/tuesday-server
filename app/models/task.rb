class Task < ApplicationRecord
  belongs_to :project, :optional => true
end
