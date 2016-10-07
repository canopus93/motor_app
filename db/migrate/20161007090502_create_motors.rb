class CreateMotors < ActiveRecord::Migration[5.0]
  def change
    create_table :motors do |t|
    	t.string :name
    	t.decimal :velocity
    	t.decimal :current_fuel
    	t.decimal :max_fuel

      t.timestamps
    end
  end
end
