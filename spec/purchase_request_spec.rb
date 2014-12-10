require_relative 'spec_helper.rb'

describe PuppyBreeder::PurchaseRequest do
  before(:each) do
    PuppyBreeder::Repo::Repo.new
    repo = PuppyBreeder::Repo::PurchaseRequestRepo.new
    repo.create_table
  end

  describe "#create_purchase_order" do
    it "orders a puppy of the breed the customer desires" do
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("Alice", "Dachshund")
      expect(order["customer_name"]).to eq("Alice")
      breed = PuppyBreeder::Breed.get_breed("Dachshund")
      expect(order["breed"]).to eq(breed[:id])
    end
  end

  describe "#review_orders" do
    it "displays the orders that have not been filled" do
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("Someone", "The Best Dog")
      review = PuppyBreeder::PurchaseRequest.review_orders()[0]
      expect(review).to be_a(Hash)
    end
  end

  describe "#remove_order" do
    it "removes the order by passed-in customer name" do
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("A Person", "A Species")
      removed_order = PuppyBreeder::PurchaseRequest.remove_order("A Person")
      expect(removed_order["breed"].to_i).to be_a(Integer)
    end
  end

  describe "#complete_purchase_request" do
    it "pushes filled order to PuppyBreeder::FilledOrders" do
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("A Person", "A Species")
      dog = PuppyBreeder::Puppy.add_puppy("A Dog", "A Species")
      complete = PuppyBreeder::PurchaseRequest.complete_purchase_request("A Person", "A Dog", "A Price", "2/1/13")
    end
  end

  describe "#check_inventory" do
    it "takes in breed and returns puppy object" do
        PuppyBreeder::Puppy.remove_puppies
        PuppyBreeder::Puppy.add_puppy("Balto", "Siberian Husky")
        dog = PuppyBreeder::PurchaseRequest.check_inventory("Siberian Husky")
        expect(dog["name"]).to eq("Balto")
    end
  end

end