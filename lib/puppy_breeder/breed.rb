module PuppyBreeder
  require_relative '../repo/breed_repo.rb'

  class Breed
    attr_reader :type, :price

    @@breeds = BreedRepo.new

    def initialize(type, price)
      @type = type
      @price = price
    end
    
    def self.set_breed_price(type, price)
      @@breeds.add_breed(Breed.new(type, price))
    end

    def self.get_breed(type)
      @@breeds.get_breed(type)
    end

    def self.clear_breeds
      @@breeds = BreedRepo.new
    end

  end
end