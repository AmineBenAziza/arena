class Hit < ApplicationRecord
  belongs_to :fight_participation_equipment,
    foreign_key: "fight_participation_equipment_id",
    optional: :true
  belongs_to :fight_participation
end
