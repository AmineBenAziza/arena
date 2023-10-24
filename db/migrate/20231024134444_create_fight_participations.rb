class CreateFightParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :fight_participations do |t|

      t.references :fight, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
