require 'rails_helper'

describe Equipment do
  describe "database" do
    describe "schema" do
      it { should have_db_column( :id ).with_options( null: false ) }

      it { should have_db_column( :name           ).of_type( :string   ) }
      it { should have_db_column( :attack_points  ).of_type( :integer  ) }
      it { should have_db_column( :defense_points ).of_type( :integer  ) }
      it { should have_db_column( :type           ).of_type( :string   ) }

      it { should have_db_column( :created_at     ).of_type( :datetime ) }
      it { should have_db_column( :updated_at     ).of_type( :datetime ) }
    end

    describe "association" do
      it { should have_many(:fight_participation_equipment).dependent(:destroy)                }
      it { should have_many(:fight_participations).through(:fight_participation_equipment)                 }
    end
  end

  describe 'scopes' do
    let!(:sword) { create :equipment, name: "sword", attack_points: 50, defense_points: 0, type: "Weapon" }
    let!(:kevlar) { create :equipment, name: "kevlar", attack_points: 0, defense_points: 25, type: "Shield" }
    describe '.weapon' do
      it 'return only weapens equipment' do
        expect(Equipment.weapon).to contain_exactly(
          an_object_having_attributes(sword.attributes)
        )
      end
    end

    describe '.shield' do
      it 'return only Shildes equipment' do
        expect(Equipment.shield).to contain_exactly(
          an_object_having_attributes(kevlar.attributes)
        )
      end
    end
  end
end