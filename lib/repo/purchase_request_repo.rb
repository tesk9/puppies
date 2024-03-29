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

  def get_orders
    @hash
  end

  def update(order, field, value)
    puts @hash[order].hold
    @hash[order].hold = value
  end
end