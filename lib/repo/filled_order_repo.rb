class FilledOrderRepo
  def initialize
    @hash = {}
  end

  def add_filled_order (order)
    @hash[order.customer.to_sym] = order
  end

  def review
    @hash.each do |key, value|
      puts "#{value.customer} | #{value.puppy} | #{value.price} | #{value.date_filled}"
    end
  end
end