class AddImageToCuisines < ActiveRecord::Migration[7.0]
  def change
    add_column :cuisines, :image, :string
  end
end
