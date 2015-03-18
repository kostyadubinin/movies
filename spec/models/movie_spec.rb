require "rails_helper"

describe Movie, :vcr do
  subject(:movie) { Movie.find(550) }

  it "has a title" do
    expect(movie.title).to eq("Fight Club")
  end

  it "belongs to genres" do
    expect(movie.genres).to all(be_an_instance_of(Genre))
  end
end
