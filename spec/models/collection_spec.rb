require "rails_helper"

describe Collection do
  let(:collection_attrs) {
    { "id"            => 121938,
      "name"          => "The Hobbit Collection",
      "poster_path"   => "/hQghXOjSS2xfzx9XnMyZqt8brCF.jpg",
      "backdrop_path" => "/7wO7MSnP5UcwR2cTHdJFF1vP4Ie.jpg" }
  }

  subject(:collection) { Collection.new(collection_attrs) }

  it "has an id" do
    collection_attrs["id"] = 121938
    expect(collection.id).to eq(121938)
  end


  it "has a name" do
    collection_attrs["name"] = "The Hobbit Collection"
    expect(collection.name).to eq("The Hobbit Collection")
  end

  it "has a poster path" do
    collection_attrs["poster_path"] = "/poster.png"
    expect(collection.poster_path).to eq("/poster.png")
  end

  it "has a backdrop path" do
    collection_attrs["backdrop_path"] = "/backdrop.jpg"
    expect(collection.backdrop_path).to eq("/backdrop.jpg")
  end
end
