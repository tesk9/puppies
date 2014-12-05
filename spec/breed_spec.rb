require "spec_helper.rb"

describe PuppyBreeder::Breed do
  before(:each) do
    PuppyBreeder::Breed.clear_breeds
  end

  describe "#set_breed_price" do
    it "allows me to set the price of a breed" do
      breed = PuppyBreeder::Breed.set_breed_price("Terrier", 1000)
      expect(breed.type).to eq("Terrier")
      expect(breed).to be_a(PuppyBreeder::Breed)
      expect(breed.price).to eq(1000)
    end
  end

  describe "#get_breed"  do
    context "no breed has been set" do
      it "return nil" do
        breed = PuppyBreeder::Breed.get_breed("Terrier")
        expect(breed).to eq (nil)
      end
    end
    context "breed has been set" do
      it "return pre-defined price" do
        old_breed = PuppyBreeder::Breed.set_breed_price("Terrier", 1000)
        new_breed = PuppyBreeder::Breed.get_breed("Terrier")
        expect(new_breed.price).to eq(old_breed.price)
        expect(new_breed.type).to eq(old_breed.type)
      end
    end
  end
end