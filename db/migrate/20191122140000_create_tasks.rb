class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.text :name
      t.text :status
      t.datetime :due_date
      t.text :priority
      t.text :owner
      t.text :group

      t.timestamps
    end
  end
end
