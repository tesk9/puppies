module PuppyBreeder::Repo
  class BreedRepo < Repo

    def create_table
      command = <<-SQL 
      CREATE TABLE breeds (
        id SERIAL PRIMARY KEY,
        type text,
        price Money
        ); 
      SQL
      @db.exec(command)
    end

    def add_breed (breed)
      # binding.pry
      command = <<-SQL
        INSERT INTO breeds (type, price)
        VALUES ('#{breed.type}', '#{breed.price}')
        RETURNING *;
      SQL
      result = @db.exec(command)
      return {type: result.values[0][1], price: result.values[0][2]}
    end

    def get_breed (type)
      command = <<-SQL
        SELECT * FROM breeds WHERE type='#{type}';
      SQL
      result = @db.exec(command)
      if result.values.length == 0
        return nil
      end
      return {type: result.values[0][1], price: result.values[0][2]}
    end

    def clear_breeds 
      command = <<-SQL 
        DROP TABLE IF EXISTS breeds;
      SQL
      @db.exec(command)
    end
  end
end