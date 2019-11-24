class Task < ApplicationRecord
  belongs_to :group, :optional => true
end
