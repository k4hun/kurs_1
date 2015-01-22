class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer "gallery_id"
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => true
      t.text "description"
      t.attachment :photo
      t.timestamps
    end
  end
end
