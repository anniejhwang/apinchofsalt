class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.string :prep_time
      t.string :cook_time
      t.string :total_time
      t.string :instructions

      t.timestamps
    end
  end
end
