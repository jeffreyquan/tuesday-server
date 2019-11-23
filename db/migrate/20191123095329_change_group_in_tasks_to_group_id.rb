class ChangeGroupInTasksToGroupId < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :group, :text
    add_column :tasks, :group_id, :integer
  end
end
