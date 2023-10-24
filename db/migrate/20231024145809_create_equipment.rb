class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|

      t.string :name
      t.integer :attack_points
      t.integer :defense_points
      t.string :type

      t.timestamps
    end
  end
end
