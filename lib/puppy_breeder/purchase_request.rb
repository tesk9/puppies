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

    def self.complete_purchase_request
    end
  end
end