FactoryBot.define do
  factory :fight do
    winner      { create :fighter }
  end
end