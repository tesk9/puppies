module PuppyBreeder::Repo
  class PurchaseRequestRepo < Repo
    def create_table
      drop_table
      command = <<-SQL
      CREATE TABLE purchase_requests (
        id SERIAL PRIMARY KEY,
        customer_name text,
        breed integer REFERENCES breeds (id),
        hold boolean
        );
      SQL
      @db.exec(command)
    end

    def add_new(purchase_request)
      breed_listing =  PuppyBreeder::Breed.get_breed(purchase_request.breed)
      hold = false
      if !breed_listing
        breed_listing = PuppyBreeder::Breed.set_breed_price(purchase_request.breed, 0)
        hold = true
      end
      command = <<-SQL
        INSERT INTO purchase_requests (customer_name, breed, hold)
        VALUES ('#{purchase_request.customer_name}', '#{breed_listing[:id]}', '#{hold}')
        RETURNING *;
      SQL
      result = @db.exec(command)
      return result[0]
    end

    def remove(customer)
      command1 = <<-SQL
        SELECT breed FROM purchase_requests
        WHERE customer_name = '#{customer}'
      SQL
      command = <<-SQL
        DELETE FROM purchase_requests
        WHERE customer_name = '#{customer}'
      SQL
      pop_order = @db.exec(command1)
      @db.exec(command)
      return pop_order[0]
    end

    def get_orders
      command = <<-SQL
        SELECT * FROM purchase_requests;
      SQL
      results = @db.exec(command)
      return results
    end

    def update(order, field, value)
      
    end

    def drop_table
      command = <<-SQL
        DROP TABLE IF EXISTS purchase_requests CASCADE;
      SQL
      @db.exec(command)
    end
  end
end