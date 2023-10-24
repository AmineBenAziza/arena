require 'rails_helper'

describe Fighter do
  describe "database" do
    describe "schema" do
      it { should have_db_column( :id ).with_options( null: false ) }

      it { should have_db_column( :name              ).of_type( :string    ) }
      it { should have_db_column( :life_points       ).of_type( :integer   ) }
      it { should have_db_column( :attack_points     ).of_type( :integer   ) }
      it { should have_db_column( :experience_points ).of_type( :integer   ) }


      it { should have_db_column( :created_at    ).of_type( :datetime ) }
      it { should have_db_column( :updated_at    ).of_type( :datetime ) }
    end

    describe "association" do
      it { should have_many(:fight_participations).dependent(:destroy)                   }
      it { should have_many(:fights).through(:fight_participations)                      }
      it { should have_many(:wins).class_name("Fight").with_foreign_key(:winner_id) }
    end
  end
end