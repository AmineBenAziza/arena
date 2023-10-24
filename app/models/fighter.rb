class Fighter < ApplicationRecord
  has_many :fight_participations, dependent: :destroy
  has_many :fights, through: :fight_participations
  has_many :wins, class_name: "Fight", foreign_key: "winner_id"
end
