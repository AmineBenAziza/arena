require 'rails_helper'

describe FightParticipationEquipment do
  describe "database" do
    describe "schema" do
      it { should have_db_column( :id ).with_options( null: false ) }

      it { should have_db_column( :fight_participation_id ).of_type( :integer  ).with_options( null: false ) }
      it { should have_db_column( :equipment_id           ).of_type( :integer  ).with_options( null: false ) }

      it { should have_db_column( :created_at     ).of_type( :datetime ) }
      it { should have_db_column( :updated_at     ).of_type( :datetime ) }
    end

    describe "Indexes" do
      it { should have_db_index( :equipment_id           ) }
      it { should have_db_index( :fight_participation_id ) }
    end

    describe "association" do
      it { should belong_to(:fight_participation) }
      it { should belong_to(:equipment          ) }

      it { should have_many(:hits).dependent(:destroy) }
    end
  end

end