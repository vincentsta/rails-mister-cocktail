class AddVotesToCocktail < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktails, :votes, :string
  end
end
