class CreateRecipes < ActiveRecord::Migration

    def change
        create_table :recipes do |t|
            t.string :name
            t.string :ingredients
            t.string :cook_time
            t.timestamps null: false
        end
    end
end