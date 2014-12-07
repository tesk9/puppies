module PuppyBreeder
  require_relative '../repo/purchase_request_repo.rb'

  class PurchaseRequest
    attr_reader :breed, :customer_name
    attr_accessor :hold

    @@orders = PurchaseRequestRepo.new

    def initialize(customer, breed)
      @customer_name = customer
      @breed = breed
      @hold = false
    end

    def self.new_order(customer, breed)
      order = create_purchase_order(customer, breed)
      if !check_inventory(breed)
        @@orders.update(customer, "hold", true)
      end
      order
    end

    def self.create_purchase_order(customer, breed)
      @@orders.add_new(PurchaseRequest.new(customer, breed))
    end

    def self.clear_orders
      @@orders = PurchaseRequestRepo.new
    end

    def self.review_orders
      @@orders.get_orders.each do |key, value|
        puts "#{value.customer_name} | #{value.breed}"
      end
    end

    def self.review_to_fill
      @@orders.get_orders.each do |key, value|
        if value.hold == false
          puts "#{value.customer_name} | #{value.breed}"
        end
      end
    end

    def self.check_for_matches
      orders = @@orders.get_orders
      orders.each do |key, value|
        breed = value.breed
        check_inventory(breed)
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
      inventory = PuppyBreeder::Puppy.get_inventory
      breed = inventory[dog].breed
      PuppyBreeder::Puppy.remove_puppy(dog)
      price = price || PuppyBreeder::Breed.get_breed(breed)
      PuppyBreeder::FilledOrders.add_filled_order(self.customer_name, dog, price, date)
    end

    def remove_order(customer)
      @@orders.remove(customer)
    end
  end
end