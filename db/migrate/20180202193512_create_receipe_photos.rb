class CreateReceipePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :receipe_photos do |t|
      t.integer :receipe_id
      t.text :photo

      t.timestamps
    end
  end
end
