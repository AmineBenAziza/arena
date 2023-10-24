class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Fighter", optional: true
  has_many :fight_participations, dependent: :destroy
  has_many :fighters, through: :fight_participations
  has_many :hits, through: :fight_participations, dependent: :destroy
end
