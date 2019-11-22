class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :email
      t.string :password_digest
      t.string :name
      t.boolean :admin

      t.timestamps
    end
  end
end
