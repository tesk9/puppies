require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
  describe "#add_puppy" do
    it "creates a new puppy of unknown heritage" do
      pup = PuppyBreeder::Puppy.add_puppy("Lassie")
      expect(pup).to be_a(PuppyBreeder::Puppy)
      expect(pup.name).to eq("Lassie")
      expect(pup.breed).to eq("mutt")
      expect(pup.mother).to eq("unknown")
      expect(pup.father).to eq("unknown")
    end

    it "creates a new puppy of known heritage" do
      pup = PuppyBreeder::Puppy.add_puppy("Red", "Golden Retriever", "Yellow", "Purple")
      expect(pup).to be_a(PuppyBreeder::Puppy)
      expect(pup.name).to eq("Red")
      expect(pup.breed).to eq("Golden Retriever")
      expect(pup.mother).to eq("Yellow")
      expect(pup.father).to eq("Purple")
    end

    it "adds a puppy to the inventory" do
      pup = PuppyBreeder::Puppy.add_puppy("Winn-Dixie")
      review = PuppyBreeder::Puppy.show_inventory
      expect(review.length).to be > 0
    end
  end

  describe "#get_inventory" do
    it "returns the puppy inventory" do
      pup = PuppyBreeder::Puppy.add_puppy("Winn-Dixie")
      inv = PuppyBreeder::Puppy.get_inventory
      expect(inv.length).to be > 0
    end
  end
end