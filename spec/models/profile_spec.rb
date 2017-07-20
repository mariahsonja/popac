require "rails_helper"

RSpec.describe Profile do
  describe ".search" do
    let(:brazil) { }
    let(:canada) { }
    let(:joe) { create(:profile, name: "Joe") }
    let!(:susan) { create(:profile, name: "Susan") }

    context "filtering by country" do
    end
    
    context "filtering by interest" do
    end
    
    context "filtering by country and interest" do
    end
    
    context "with no filters" do
    end
  end
end
