class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.integer :receipe_id
      t.text :ingred

      t.timestamps
    end
  end
end
