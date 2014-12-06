require_relative 'spec_helper.rb'

describe PuppyBreeder::PurchaseRequest do
  before(:each) do
    PuppyBreeder::PurchaseRequest.clear_orders
  end

  describe "#create_purchase_order" do
    it "orders a puppy of the breed the customer desires" do
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("Alice", "Dachshund")
      expect(order).to be_a(PuppyBreeder::PurchaseRequest)
      expect(order.customer_name).to eq("Alice")
      expect(order.breed).to eq("Dachshund")
    end
  end

  describe "#review_orders" do
    it "displays the orders that have not been filled" do
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("Someone", "The Best Dog")
      review = PuppyBreeder::PurchaseRequest.review_orders()
      expect(review).to be_a(Hash)
    end
  end

  describe "#remove_order" do
    it "removes the order by passed-in customer name" do
      PuppyBreeder::PurchaseRequest.clear_orders
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("A Person", "A Species")
      removed_order = order.remove_order("A Person")
      expect(removed_order).to eq("A Species")
    end
  end

  describe "#complete_purchase_request" do
    it "pushes filled order to PuppyBreeder::FilledOrders" do
      PuppyBreeder::PurchaseRequest.clear_orders
      order = PuppyBreeder::PurchaseRequest.create_purchase_order("A Person", "A Species")
      complete = order.complete_purchase_request("A Dog", "A Price", "2/1/13")
      expect(complete).to be_a(PuppyBreeder::FilledOrders)
    end
  end
end