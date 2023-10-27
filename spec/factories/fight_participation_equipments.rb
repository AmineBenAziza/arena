FactoryBot.define do
  factory :fight_participation_equipment do
    fight_participation        { create :fight_participation }
    equipment   { create :equipment }
  end
  factory :fight_participation_weapon do
    fight_participation        { create :fight_participation }
    weapon   { create :weapon }
  end
end