class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string "name"
      t.integer "position"
      t.text "description"
      t.boolean "visible", :default => false
      t.timestamps
    end
  end
end
