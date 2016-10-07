class CreateGarages < ActiveRecord::Migration[5.0]
  def change
    create_table :garages do |t|
    	t.references :person, foreign_key: true
    	t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
