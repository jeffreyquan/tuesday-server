class RemoveProjectIdInTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :project_id, :integer
  end
end
