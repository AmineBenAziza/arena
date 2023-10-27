FactoryBot.define do
    factory :fight_participation do
      fight        { create :fight }
      fighter      { create :fighter }
    end
  end