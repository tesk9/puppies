module PuppyBreeder
  puts "~Welcome to PuppyBreeder~"
  puts "\n Available Actions:"
  puts "puppy.add_puppy(name, breed, mother, father) to add a new puppy to inventory"
  puts "puppy.show_inventory to display available puppies"
  puts "\norder.new_order(customer, breed) to put in a request for a particular breed"
  puts "order.review_orders to display all outstanding orders"
  puts "order.review_to_fill to display orders not on hold"
  puts "order.check_for_matches to cross reference dog breeds in inventory and outstanding orders"
  puts "order.check_inventory(breed) to find a dog in inventory by breed"
  puts "order.complete_purchase_request(dog, price, date) to close out an order"
end

require_relative 'repo/repo.rb'
require_relative 'puppy_breeder/puppy.rb'
require_relative 'puppy_breeder/purchase_request.rb'
require_relative 'puppy_breeder/breed.rb'
require_relative 'puppy_breeder/filled_orders.rb'


def puppy
  PuppyBreeder::Puppy
end

def order
  PuppyBreeder::PurchaseRequest
end
  
def fill
  PuppyBreeder::FilledOrders
end

def breed
  PuppyBreeder::Breed
end