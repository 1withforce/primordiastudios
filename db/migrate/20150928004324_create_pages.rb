class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :page_num
      t.string :text
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
