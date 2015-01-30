require("spec_helper")

describe(Venue) do

  it {should have_and_belong_to_many(:bands)}
  it {should validate_presence_of(:name)}

  it("will capitalize name before saving itself") do
    test_venue = Venue.create({:name => "the blackbird"})
    expect(test_venue.name()).to(eq("The Blackbird"))
  end

end
