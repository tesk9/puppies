class BreedRepo
  def initialize
    @hash = {}
  end

  def add_breed (breed)
    @hash[breed.type] = breed
  end

  def get_breed (type)
    @hash[type]
  end
end