class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :creator
      t.string :medium
      t.text :description

      t.timestamps null: false
    end
  end
end
