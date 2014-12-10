module PuppyBreeder
  require_relative '../repo/purchase_request_repo.rb'

  class PurchaseRequest
    attr_reader :breed, :customer_name
    attr_accessor :hold

    @@orders = Repo::PurchaseRequestRepo.new

    def initialize(customer, breed)
      @customer_name = customer
      @breed = breed
      @hold = false
    end

    def self.create_purchase_order(customer, breed)
      @@orders.add_new(PurchaseRequest.new(customer, breed))
    end

    def self.clear_orders
      @@orders = Repo::PurchaseRequestRepo.new
    end

    def self.review_orders
      @@orders.get_orders.each do |order|
        puts "#{order["customer_name"]} | #{order["breed"]}"
      end
    end

    def self.review_to_fill
      @@orders.get_orders.each do |key, value|
        if value.hold == false
          puts "#{value.customer_name} | #{value.breed}"
        end
      end
    end

    def self.check_inventory(breed)
      inv = PuppyBreeder::Puppy.show_inventory
      breed_check = PuppyBreeder::Breed.get_breed_name(inv["breed"])
      if breed_check == breed.to_s
        return inv
      end
      false
    end

    def self.complete_purchase_request(customer_name, dog, price, date)
      remove_order(customer_name)
      pup_record = PuppyBreeder::Puppy.remove_puppy(dog)
      price = price || PuppyBreeder::Breed.get_breed(breed)
      PuppyBreeder::FilledOrders.add_filled_order(customer_name, pup_record, price, date)
    end

    def self.remove_order(customer)
      @@orders.remove(customer)
    end
  end
end