class CreateAtricles < ActiveRecord::Migration
  def change
    create_table :atricles do |t|
      t.integer "page_id"
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => true
      t.text "content"
      t.attachment :photo
      t.timestamps
    end
  end
end
