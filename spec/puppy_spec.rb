require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
  describe "#add_puppy" do
    it "adds a new puppy of unknown heritage to breeder inventory" do
      pup = PuppyBreeder::Puppy.add_puppy("Lassie")
      expect(pup).to be_a(PuppyBreeder::Puppy)
      expect(pup.name).to eq("Lassie")
      expect(pup.breed).to eq("unknown")
      expect(pup.mother).to eq("unknown")
      expect(pup.father).to eq("unknown")
    end

    it "adds a new puppy of known heritage to breeder inventory" do
      pup = PuppyBreeder::Puppy.add_puppy("Red", "Golden Retriever", "Yellow", "Purple")
      expect(pup).to be_a(PuppyBreeder::Puppy)
      expect(pup.name).to eq("Red")
      expect(pup.breed).to eq("Golden Retriever")
      expect(pup.mother).to eq("Yellow")
      expect(pup.father).to eq("Purple")
    end
  end
end