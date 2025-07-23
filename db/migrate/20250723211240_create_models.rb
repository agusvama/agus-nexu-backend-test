class CreateModels < ActiveRecord::Migration[7.1]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :average_price
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
