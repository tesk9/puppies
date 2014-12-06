#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest
    attr_reader :breed, :customer_name

    @@orders = {}

    def initialize(customer, breed)
      @customer_name = customer
      @breed = breed
    end

    def self.create_purchase_order(customer, breed)
      @@orders[customer] = breed
      PurchaseRequest.new(customer, breed)
    end

    def self.clear_orders
      @@orders = {}
    end

    def self.review_orders
      puts @@orders
      @@orders
    end

    def complete_purchase_request(dog, price, date)
      remove_order(self.customer_name)
      PuppyBreeder::FilledOrders.add_filled_order(self.customer_name, dog, price, date)
    end

    def remove_order(customer)
      @@orders.delete(customer)
    end
  end
end