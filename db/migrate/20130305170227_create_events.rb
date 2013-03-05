class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :type_cd, default: 0
      t.integer :user_id
      t.integer :place_id
      t.integer :place_state_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
