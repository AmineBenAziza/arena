class FightParticipationEquipment < ApplicationRecord
  belongs_to :fight_participation
  belongs_to :equipment
  has_many   :hits, dependent: :destroy
end
