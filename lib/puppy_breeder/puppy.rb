#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
    attr_accessor :name, :breed, :mother, :father

    @@inventory = {}

    def initialize(name, breed, mother, father)
      @name = name
      @breed = breed
      @mother = mother
      @father = father
    end

    def self.add_puppy(name, breed="unknown", mother="unknown", father="unknown")
      puppy = Puppy.new(name, breed, mother, father)
    end

  end
end