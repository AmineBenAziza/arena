FactoryBot.define do
    factory :equipment do
      attack_points   { rand(25..150) }
      defense_points  { rand(25..50) }
      type { %w( Shield Weapon ).sample }
    end
  end
