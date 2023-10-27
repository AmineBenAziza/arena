FactoryBot.define do
    factory :hit do
      fight_participation        { create :fight_participation }
      fight_participation_weapon { create :fight_participation_weapon }
    end
  end