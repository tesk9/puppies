module PuppyBreeder
  class Breed
    attr_reader :type, :price

    @@breeds = Repo::BreedRepo.new

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

    def self.get_breed_name(id)
      @@breeds.get_breed_name(id)
    end

    def self.clear_breeds
      @@breeds.clear_breeds
    end

  end
end