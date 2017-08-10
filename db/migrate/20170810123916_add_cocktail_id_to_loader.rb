class AddCocktailIdToLoader < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktailloaders, :mrcock_id, :integer
  end
end
