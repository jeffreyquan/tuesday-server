class AddEmailToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :email, :text
  end
end
