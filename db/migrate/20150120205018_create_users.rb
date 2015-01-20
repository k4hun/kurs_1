class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "firstname", :limit => 20
      t.string "lastname", :limit => 60
      t.string "user", :limit => 25
      t.string "email", :default => "", :limit => 100, :null => false
      t.string "phone", :default => "", :null => false
      t.string "password_digest"
      t.timestamps
    end
    add_index("users", "user")
  end

  def down
    drop_table :users
  end
end
