require 'rails_helper'

describe Hit do
  describe "database" do
    describe "schema" do
      it { should have_db_column( :id ).with_options( null: false ) }

      it { should have_db_column( :fight_participation_equipment_id       ).of_type( :integer   ) }
      it { should have_db_column( :fight_participation_id     ).of_type( :integer   ).with_options( null: false ) }
      it { should have_db_column( :damage ).of_type( :integer   ) }


      it { should have_db_column( :created_at    ).of_type( :datetime ) }
      it { should have_db_column( :updated_at    ).of_type( :datetime ) }
    end

    describe "Indexes" do
      it { should have_db_index( :fight_participation_equipment_id           ) }
      it { should have_db_index( :fight_participation_id ) }
    end

    describe "association" do
      it { should belong_to(:fight_participation_weapon ).with_foreign_key( :fight_participation_equipment_id ).optional(:true) }
      it { should belong_to(:fight_participation ) }
    end
  end

  describe '#set_up_hit' do
    let!(:fighter) { create(:fighter, experience_points: 100, attack_points: 10) }
    let!(:weapon) { create(:weapon, attack_points: 5) }
    let!(:fight_participation) { create(:fight_participation, fighter: fighter) }
    let(:fight_participation_equipment) { create(:fight_participation_equipment, fight_participation: fight_participation, equipment: weapon) }
    let(:hit) { build(:hit, fight_participation: fight_participation, fight_participation_weapon: nil) }

    it 'sets up hit correctly' do
      allow(fight_participation.fight_participation_weapons).to receive(:sample).and_return(fight_participation_equipment)
      hit.set_up_hit
      expect(hit.fight_participation_weapon).to eq(fight_participation_equipment)
      expect(hit.damage).to be_between(0, 24)
    end

    it 'handles the case when fight_participation is nil' do
      hit.fight_participation = nil

      expect { hit.set_up_hit }.not_to raise_error
      expect(hit.fight_participation_weapon).to be_nil
      expect(hit.damage).to be_nil
    end

    it 'handles the case when there are no available weapons' do
      fight_participation.fight_participation_weapons.destroy_all
      expect { hit.set_up_hit }.not_to raise_error
      expect(hit.fight_participation_weapon).to be_nil
      expect(hit.damage).to be_between(0, 19)
    end
  end
end