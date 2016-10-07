class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
    	t.string :name, null: false
    	t.decimal :money, null: false, precision: 20, scale: 3

      t.timestamps
    end
  end
end
