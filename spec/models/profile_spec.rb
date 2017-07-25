require "rails_helper"

RSpec.describe Profile do
  describe ".search" do
    let(:brazil)  { create(:country, name: "Brazil") }
    let(:canada)  { create(:country, name: "Canada") }
    let(:child)   { create(:interest, :child) }
    let(:refugee) { create(:interest, :refugee) }

    context "filtering by country" do
      let!(:joe)   { create(:profile, name: "Joe",   country: brazil, interests: [child]) }
      let!(:susan) { create(:profile, name: "Susan", country: canada, interests: [child]) }

      subject { described_class.search(country_ids: [brazil.id]) }

      it "returns all profiles filtered by country_id" do
        expect(subject).to match_array([joe])
      end
    end
    
    context "filtering by interest" do
      let!(:joe)   { create(:profile, name: "Joe",   country: brazil, interests: [child]) }
      let!(:susan) { create(:profile, name: "Susan", country: canada, interests: [refugee]) }

      subject { described_class.search(interest_ids: [refugee.id]) }

      it "returns all profiles filtered by interest_id" do
        expect(subject).to match_array([susan])
      end
    end
    
    context "filtering by country and interest" do
      let!(:joe)   { create(:profile, name: "Joe",   country: brazil, interests: [child]) }
      let!(:susan) { create(:profile, name: "Susan", country: canada, interests: [child, refugee]) }

      subject { described_class.search(interest_ids: [child.id], country_ids: [canada.id]) }

      it "returns all profiles filtered by interest_id and country_id" do
        expect(subject).to match_array([susan])
      end
    end
    
    context "with no filters" do
      let!(:joe)   { create(:profile, name: "Joe",   country: brazil, interests: [child]) }
      let!(:susan) { create(:profile, name: "Susan", country: canada, interests: [child, refugee]) }

      subject { described_class.search }

      it "returns all profiles filtered by interest_id and country_id" do
        expect(subject).to match_array([joe, susan])
      end
    end
  end
end
