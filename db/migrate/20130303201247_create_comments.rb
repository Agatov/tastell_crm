class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :place_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end

    def down
      drop_table :comments
    end
  end
end
