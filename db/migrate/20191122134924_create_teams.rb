class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.integer :project_id
      t.string :user_id
      t.boolean :admin
      t.boolean :invitation

      t.timestamps
    end
  end
end
