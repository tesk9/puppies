module PuppyBreeder
  class FilledOrders
    attr_reader :puppy, :customer, :price, :date_filled

    @@filled = {}

    def initialize(puppy, customer, price, date_filled)
      @puppy = puppy
      @customer = customer
      @price = price
      @date_filled = date_filled
    end

    def self.add_filled_order(puppy, customer, price, date_filled)
      @@filled[customer] = FilledOrders.new(customer, puppy, price, date_filled)
    end

    def self.revew_filled_orders
      puts @@filled
      @@filled 
    end
  end
end