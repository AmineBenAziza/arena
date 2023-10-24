require 'rails_helper'

describe FightParticipation do
  describe "database" do
    describe "schema" do
      it { should have_db_column( :id ).with_options( null: false ) }

      it { should have_db_column( :fight_id   ).of_type( :integer  ).with_options( null: false ) }
      it { should have_db_column( :fighter_id ).of_type( :integer  ).with_options( null: false ) }

      it { should have_db_column( :created_at     ).of_type( :datetime ) }
      it { should have_db_column( :updated_at     ).of_type( :datetime ) }
    end

    describe "Indexes" do
      it { should have_db_index( :fight_id   ) }
      it { should have_db_index( :fighter_id ) }
    end

    describe "association" do
      it { should belong_to(:fight   ) }
      it { should belong_to(:fighter ) }

      it { should have_many(:fight_participation_equipments).dependent(:destroy ) }
      it { should have_many(:equipments).through(:fight_participation_equipments) }
      it { should have_many(:hits).dependent(:destroy ) }
    end
  end

end