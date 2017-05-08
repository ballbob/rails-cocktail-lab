class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :ingredient

      t.timestamps null: false
    end
  end
end
