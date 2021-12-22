class CreateMeals < ActiveRecord::Migration
  def up
    create_table :meals , { id: false } do |t|
      t.string :meal_id, :unique => true , :null => false
      t.date :meal_date, :unique => true , :null => false
      t.string :meal_interval, :unique => true , :null => false

      t.timestamps null: false
    end
    execute "ALTER TABLE meals ADD PRIMARY KEY (meal_date,meal_interval);"
    execute "ALTER TABLE meals ADD UNIQUE (meal_id);"
  end

  def down
    drop_table :meals
  end
end