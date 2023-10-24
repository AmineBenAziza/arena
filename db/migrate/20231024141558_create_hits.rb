class CreateHits < ActiveRecord::Migration[7.0]
  def change
    create_table :hits do |t|

      t.references :fight_participation_equipment, foreign_key: true
      t.references :fight_participation, null: false, foreign_key: true
      t.integer :damage

      t.timestamps
    end
  end
end
