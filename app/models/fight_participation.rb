class FightParticipation < ApplicationRecord
  belongs_to :fight
  belongs_to :fighter

  has_many :fight_participation_equipments, dependent: :destroy
  has_many :equipments, through: :fight_participation_equipments
  has_many :hits, dependent: :destroy
  accepts_nested_attributes_for :fight_participation_equipments

  has_many :fight_participation_weapons, class_name: "FightParticipationEquipment"
  has_many :weapons, -> { where(type: "Weapon") }, through: :fight_participation_weapons, source: :equipment
  accepts_nested_attributes_for :fight_participation_weapons

  has_many :fight_participation_shields, class_name: "FightParticipationEquipment"
  has_many :shields, -> { where(type: "Shield") }, through: :fight_participation_shields, source: :equipment
  accepts_nested_attributes_for :fight_participation_shields

  attribute :full_life_points, :integer

  after_initialize :set_default_full_life_points

  private

  def set_default_full_life_points
    return if fighter.nil?

    self.full_life_points = fighter.life_points + shields.sum(:defense_points)
  end

end
