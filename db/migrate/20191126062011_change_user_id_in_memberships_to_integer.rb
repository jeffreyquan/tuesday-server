class ChangeUserIdInMembershipsToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :memberships, :user_id, :string
    add_column :memberships, :user_id, :integer
  end
end
