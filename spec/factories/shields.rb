FactoryBot.define do
  factory :shield do
    attack_points   { 0}
    defense_points  { rand(5..50) }
    name { %w( FullShield LightShield ).sample }
  end
end