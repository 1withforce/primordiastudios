class CreateRoyalHouses < ActiveRecord::Migration
  def change
    create_table :royal_houses do |t|
      t.string :name
      t.string :alliance
      t.text :description

      t.timestamps null: false
    end
  end
end
