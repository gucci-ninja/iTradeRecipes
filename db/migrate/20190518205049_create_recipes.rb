class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :img_url
      t.string :ingredients

      t.timestamps
    end
  end
end
