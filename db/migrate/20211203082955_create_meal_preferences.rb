class CreateMealPreferences < ActiveRecord::Migration
  def change
    create_table :meal_preferences , { id: false } do |t|
      t.string :office_email, :unique => true , :null => false
      t.date :meal_date, :unique => true , :null => false
      t.string :breakfast, :null => false
      t.string :lunch, :null => false
      t.string :dinner, :null => false

      t.timestamps null: false
    end
    execute "ALTER TABLE meal_preferences ADD PRIMARY KEY (office_email,meal_date);"
  end
end
