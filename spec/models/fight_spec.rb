require 'rails_helper'

describe Fight do
  describe "database" do
    describe "schema" do
      it { should have_db_column( :id ).with_options( null: false ) }

      it { should have_db_column( :winner_id ).of_type( :integer    ) }
      it { should have_db_column( :created_at    ).of_type( :datetime ) }
      it { should have_db_column( :updated_at    ).of_type( :datetime ) }
    end

    describe "Indexes" do
      it { should have_db_index( :winner_id     ) }
    end

    describe "association" do
      it { should belong_to(:winner).class_name("Fighter").optional(:true)   }
      it { should have_many(:fight_participations).dependent(:destroy)                }
      it { should have_many(:fighters).through(:fight_participations)                 }
      it { should have_many(:hits).through(:fight_participations).dependent(:destroy) }
    end
  end
end