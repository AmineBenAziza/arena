class FightParticipation < ApplicationRecord
  belongs_to :fight
  belongs_to :fighter

  has_many :fight_participation_equipments, dependent: :destroy
  has_many :equipments, through: :fight_participation_equipments
  has_many :hits, dependent: :destroy
end
