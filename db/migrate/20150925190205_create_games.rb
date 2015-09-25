class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :platform
      t.string :genre
      t.string :link
      t.text :description

      t.timestamps null: false
    end
  end
end
