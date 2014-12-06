module PuppyBreeder
  require_relative "../repo/filled_order_repo.rb"

  class FilledOrders
    attr_reader :puppy, :customer, :price, :date_filled

    @@filled = FilledOrderRepo.new

    def initialize( customer, puppy, price, date_filled)
      @customer = customer
      @puppy = puppy
      @price = price
      @date_filled = date_filled
    end

    def self.add_filled_order(customer, puppy, price, date_filled)
      @@filled.add_filled_order(FilledOrders.new(customer, puppy, price, date_filled))
    end

    def self.review_filled_orders
      @@filled.review 
    end
  end
end