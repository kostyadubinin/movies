require "rails_helper"

describe Genre do
  let(:genre_attributes) {
    {
      "id" => 12,
      "name" => "Adventure"
    }
  }

  subject(:genre) { Genre.new(genre_attributes) }

  it "has an id" do
    genre_attributes["id"] = 14
    expect(genre.id).to eq(14)
  end

  it "has a name" do
    genre_attributes["name"] = "Fantasy"
    expect(genre.name).to eq("Fantasy")
  end
end
