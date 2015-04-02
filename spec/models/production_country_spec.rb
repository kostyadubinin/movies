require "rails_helper"

describe ProductionCountry do
  let(:attributes) {
    {
      "iso_3166_1" => "NZ",
      "name" => "New Zealand"
    }
  }

  subject(:company) { ProductionCountry.new(attributes) }

  it "has an iso_3166_1" do
    attributes["iso_3166_1"] = "US"
    expect(company.iso_3166_1).to eq("US")
  end

  it "has an name" do
    attributes["name"] = "United States of America"
    expect(company.name).to eq("United States of America")
  end
end
