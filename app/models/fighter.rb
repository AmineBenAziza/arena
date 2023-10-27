class Fighter < ApplicationRecord
  has_many :fight_participations, dependent: :destroy
  has_many :fights, through: :fight_participations
  has_many :wins, class_name: "Fight", foreign_key: "winner_id", dependent: :destroy

  has_one_attached :avatar, dependent: :purge_later

  accepts_nested_attributes_for :fight_participations
  before_save :max_experience


  # check if the expiriense in the limit
  def max_experience
    if self.experience_points.present?
      self.experience_points = 1000 if self.experience_points > 1000
    else
      self.experience_points = 0
    end
  end

  def wins_fight
    return 0 unless self.fights.exists?
    self.wins.count
  end

  def lost_fight
    return 0 unless self.fights.exists?
    self.fights.count- wins_fight
  end
end
