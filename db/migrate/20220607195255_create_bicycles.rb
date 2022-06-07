class CreateBicycles < ActiveRecord::Migration[7.0]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.string :location
      t.integer :price_day
      t.integer :number_wheels
      t.string :bicycle_type
      t.string :brand
      t.boolean :foldable

      t.timestamps
    end
  end
end
