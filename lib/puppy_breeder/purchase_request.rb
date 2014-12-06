module PuppyBreeder
  require_relative '../repo/purchase_request_repo.rb'

  class PurchaseRequest
    attr_reader :breed, :customer_name

    @@orders = PurchaseRequestRepo.new

    def initialize(customer, breed)
      @customer_name = customer
      @breed = breed
    end

    def self.create_purchase_order(customer, breed)
      @@orders.add_new(PurchaseRequest.new(customer, breed))
    end

    def self.clear_orders
      @@orders = PurchaseRequestRepo.new
    end

    def self.review_orders
      @@orders.review
    end

    def self.check_for_matches
      orders = @@orders.get_orders
      orders.each do |key, value|
        breed = value.breed
        return check_inventory(breed)
      end
    end 

    def self.check_inventory(breed)
      inv = PuppyBreeder::Puppy.get_inventory
      inv.each do |dog_name, about_dog|
        if about_dog.breed == breed
          return about_dog
        end
      end
      false
    end

    def complete_purchase_request(dog, price, date)
      remove_order(self.customer_name)
      PuppyBreeder::Puppy.remove_puppy(dog)
      PuppyBreeder::FilledOrders.add_filled_order(self.customer_name, dog, price, date)
    end

    def remove_order(customer)
      @@orders.remove(customer)
    end
  end
end