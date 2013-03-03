class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :user_id
      t.string :name
      t.string :city
      t.string :address
      t.string :phones
      t.string :contact_name
      t.integer :state_cd, default: 0

      t.timestamps
    end
  end
end
