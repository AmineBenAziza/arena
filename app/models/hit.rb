class Hit < ApplicationRecord
  belongs_to :fight_participation_weapon,
    class_name: "FightParticipationEquipment",
    foreign_key: "fight_participation_equipment_id",
    optional: :true
  belongs_to :fight_participation

  before_save :set_up_hit

  def set_up_hit
    return if fight_participation.nil?
    experience_damage = fight_participation.fighter.experience_points.div(10)
    weapons = fight_participation.fight_participation_weapons.joins(:equipment).where(equipment: { type: "Weapon" })
    self.fight_participation_weapon = weapons.sample
    self.damage = rand(fight_participation.fighter.attack_points + self.fight_participation_weapon&.equipment&.attack_points.to_i + experience_damage )
  end
end
