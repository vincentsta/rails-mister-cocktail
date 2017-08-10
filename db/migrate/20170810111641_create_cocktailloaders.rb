class CreateCocktailloaders < ActiveRecord::Migration[5.0]
  def change
    create_table :cocktailloaders do |t|
      t.integer :idDrink
      t.string :strDrink
      t.string :strCategory
      t.string :strAlcoholic
      t.string :strGlass
      t.string :strInstructions
      t.string :strDrinkThumb
      t.string :strIngredient1
      t.string :strMeasure1
      t.string :strIngredient2
      t.string :strMeasure2
      t.string :strIngredient3
      t.string :strMeasure3
      t.string :strIngredient4
      t.string :strMeasure4
      t.string :strIngredient5
      t.string :strMeasure5
      t.string :strIngredient6
      t.string :strMeasure6
      t.string :strIngredient7
      t.string :strMeasure7
      t.string :strIngredient8
      t.string :strMeasure8
      t.string :strIngredient9
      t.string :strMeasure9
      t.string :strIngredient10
      t.string :strMeasure10
      t.timestamps
    end
  end
end
