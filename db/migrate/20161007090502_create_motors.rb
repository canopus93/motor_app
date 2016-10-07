class CreateMotors < ActiveRecord::Migration[5.0]
  def change
    create_table :motors do |t|

      t.timestamps
    end
  end
end
