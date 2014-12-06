class PuppyRepo
  def initialize
    @hash = {}
  end

  def add_new (puppy)
    @hash[puppy.name] = puppy
  end

  def review
    @hash.each do |key, value|
      puts "#{value.name} | #{value.breed} | #{value.mother} |  #{value.father}"
    end
  end

  def get
    @hash
  end
end