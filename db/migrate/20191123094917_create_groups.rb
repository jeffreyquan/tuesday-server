class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.text :name
      t.integer :project_id

      t.timestamps
    end
  end
end
