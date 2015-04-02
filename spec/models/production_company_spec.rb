require "rails_helper"

describe ProductionCompany do
  let(:attributes) {
    {
      "id" => 27894,
      "name" => "Metro-Goldwyn-Mayer (MGM)"
    }
  }

  subject(:company) { ProductionCompany.new(attributes) }

  it "has an id" do
    attributes["id"] = 12
    expect(company.id).to eq(12)
  end

  it "has an name" do
    attributes["name"] = "New Line Cinema"
    expect(company.name).to eq("New Line Cinema")
  end
end
