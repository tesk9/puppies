module PuppyBreeder
  require_relative "../repo/puppy_repo.rb"

  class Puppy
    attr_accessor :name, :breed, :mother, :father

    @@inventory = PuppyRepo.new

    def initialize(name, breed, mother, father)
      @name = name
      @breed = breed
      @mother = mother
      @father = father
    end

    def self.add_puppy(name, breed="mutt", mother="unknown", father="unknown")
      @@inventory.add_new(Puppy.new(name, breed, mother, father))
    end

    def self.show_inventory
      @@inventory.review
    end

    def self.get_inventory
      @@inventory.get
    end

    def self.remove_puppies
      @@inventory = PuppyRepo.new
    end

    def self.remove_puppy(name)
      @@inventory.delete(name)
    end

  end
end