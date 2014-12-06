require "spec_helper.rb"

describe PuppyBreeder::FilledOrders do
  describe ("#add_filled_order") do
    it "saves a record for filled orders" do
      order = PuppyBreeder::FilledOrders.add_filled_order("Diane", "Pupster", 500, "12/5/14")
      expect(order).to be_a(PuppyBreeder::FilledOrders)
      expect(order.customer).to eq("Diane")
      expect(order.puppy).to eq("Pupster")
      expect(order.price).to eq(500)
      expect(order.date_filled).to eq("12/5/14")
    end
  end

  describe ("#review_filled_orders") do
    it "displays filled orders, returns filled orders" do
      order_review = PuppyBreeder::FilledOrders.review_filled_orders()
      expect(order_review).to be_a(Hash)
    end
  end
end