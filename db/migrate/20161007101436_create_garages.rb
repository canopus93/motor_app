class CreateGarages < ActiveRecord::Migration[5.0]
  def change
    create_table :garages do |t|
    	t.references :people, foreign_key: true
    	t.references :motors, foreign_key: true

      t.timestamps
    end
  end
end
