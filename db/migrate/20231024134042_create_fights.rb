class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|

      t.references :winner, foreign_key: {to_table: :fighters}

      t.timestamps
    end
  end
end
