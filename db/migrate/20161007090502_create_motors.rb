class CreateMotors < ActiveRecord::Migration[5.0]
  def change
    create_table :motors do |t|
    	t.string :name, null: false
    	t.decimal :velocity, null: false, precision: 20, scale: 3
    	t.decimal :current_fuel, null: false, precision: 20, scale: 3
    	t.decimal :max_fuel, null: false, precision: 20, scale: 3
    	t.decimal :distance_travelled, null: false, precision: 20, scale: 3
    	t.decimal :time_travelled, null: false, precision: 20, scale: 3

      t.timestamps
    end
  end
end
