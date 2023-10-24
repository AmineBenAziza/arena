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
      it { should belong_to( :fight_participation_equipment ).with_foreign_key( :fight_participation_equipment_id ).optional(:true) }
      it { should belong_to(:fight_participation ) }
    end
  end
end