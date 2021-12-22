class CreateMenus < ActiveRecord::Migration
  def up
    create_table :menus , { id: false } do |t|
      t.string :menu_id, :unique => true , :null => false
      t.string :meal_id, :unique => true , :null => false
      t.string :meal_name, :unique => true , :null => false
      t.timestamps null: false
    end
    execute "ALTER TABLE menus ADD PRIMARY KEY (meal_id,meal_name);"
    execute "ALTER TABLE menus ADD UNIQUE (menu_id);"
    execute "ALTER TABLE menus ADD FOREIGN KEY (meal_id) REFERENCES meals(meal_id);"
  end

  def down
    drop_table :menus
  end
end
