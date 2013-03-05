class CreatePlaceStates < ActiveRecord::Migration
  def change
    create_table :place_states do |t|
      t.integer :place_id
      t.integer :user_id
      t.integer :state_cd

      t.timestamps
    end
  end
end
