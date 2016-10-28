class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :duration
      t.integer :price
      t.float :rating
      t.text :description
      t.references :discount, foreign_key: true
      t.references :place, foreign_key: true
      t.references :category, foreign_key: true
      t.string :image
      t.string :cover

      t.timestamps
    end
  end
end
