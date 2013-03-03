class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.integer :role_cd, default: 0
      t.string :first_name
      t.string :last_name
      t.string :avatar

      t.timestamps
    end
  end
end
