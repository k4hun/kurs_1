class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => true
      t.timestamps
    end
  end
end
