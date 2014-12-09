require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
  before(:each) do
    PuppyBreeder::Repo::Repo.new
    repo = PuppyBreeder::Repo::PuppyRepo.new
    repo.create_table
  end

  describe "#add_puppy" do
    it "creates a new puppy of unknown heritage" do
      pup = PuppyBreeder::Puppy.add_puppy("Lassie")
      expect(pup["name"]).to eq("Lassie")
      expect(pup["breed"]).to eq("2")
      expect(pup["mother"]).to eq("unknown")
      expect(pup["father"]).to eq("unknown")
    end

    it "creates a new puppy of known heritage" do
      pup = PuppyBreeder::Puppy.add_puppy("Red", "Golden Retriever", "Yellow", "Purple")
      expect(pup["name"]).to eq("Red")
      expect(pup["breed"]).to eq("3")
      expect(pup["mother"]).to eq("Yellow")
      expect(pup["father"]).to eq("Purple")
    end

    it "adds a puppy to the inventory" do
      pup = PuppyBreeder::Puppy.add_puppy("Winn-Dixie", "mutt")
      review = PuppyBreeder::Puppy.show_inventory
      expect(review.length).to be > 0
    end
  end

  describe "#show_inventory" do
    it "returns the puppy inventory" do
      pup = PuppyBreeder::Puppy.add_puppy("Winn-Dixie")
      inv = PuppyBreeder::Puppy.show_inventory
      expect(inv.length).to be > 0
    end
  end

  describe "#remove_puppy" do
    it "removes one puppy from the inventory" do
      pup = PuppyBreeder::Puppy.add_puppy("Not Long for this World")
      pop_pup = PuppyBreeder::Puppy.remove_puppy("Not Long for this World")
      expect(pop_pup).to eq(pup)
    end
  end
end