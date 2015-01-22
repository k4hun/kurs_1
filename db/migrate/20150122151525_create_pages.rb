class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => true
      t.integer "category_id"
      t.timestamps
    end
    add_index("pages", "category_id")
  end
end
