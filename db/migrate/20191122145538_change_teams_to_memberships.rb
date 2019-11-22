class ChangeTeamsToMemberships < ActiveRecord::Migration[6.0]
  def change
    rename_table :teams, :memberships
  end
end
