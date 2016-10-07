class CreateMotors < ActiveRecord::Migration[5.0]
  def change
    create_table :motors do |t|
    	t.string :name, null: false
    	t.decimal :velocity, null: false
    	t.decimal :current_fuel, null: false
    	t.decimal :max_fuel, null: false

      t.timestamps
    end
  end
end
