class PurchaseRequestRepo
  def initialize
    @hash = {}
  end

  def add_new(purchase_request)
    @hash[purchase_request.customer_name] = purchase_request
  end

  def remove(customer)
    deleted_order = @hash.delete(customer)
    deleted_order.breed
  end

  def review
    @hash.each do |key, value|
      puts "#{value.customer_name} | #{value.breed}"
    end
  end

end