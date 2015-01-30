require("spec_helper")

describe(Band) do
  it { should have_and_belong_to_many(:venues) }
  it {should validate_presence_of(:name)}

  it("will capitlize all first letters of words in name before saving to database") do
    test_band = Band.create({:name => "the rolling stones"})
    expect(test_band.name()).to(eq("The Rolling Stones"))
  end


end
