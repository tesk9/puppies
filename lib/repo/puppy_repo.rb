module PuppyBreeder::Repo
  class PuppyRepo < Repo
    def create_table
      drop_table
      command = <<-SQL 
      CREATE TABLE puppies (
        id SERIAL PRIMARY KEY,
        name text,
        breed integer REFERENCES breeds (id),
        mother text,
        father text
        ); 
      SQL
      @db.exec(command)
    end

    def add_new (puppy)
      breed_listing =  PuppyBreeder::Breed.get_breed(puppy.breed)
      if !breed_listing
        breed_listing = PuppyBreeder::Breed.set_breed_price(puppy.breed, 0)
      end
      command = <<-SQL
        INSERT INTO puppies (name, breed, mother, father)
        VALUES ('#{puppy.name}', '#{breed_listing[:id]}', '#{puppy.mother}', '#{puppy.father}')
        RETURNING *;
      SQL
      result = @db.exec(command)
      return result[0]
    end

    def review
      command = <<-SQL
        SELECT * FROM puppies;
      SQL
      results = @db.exec(command)  
      puts "#{results[0]["name"]} | #{results[0]["breed"]}"
      results[0]
    end

    def get_puppy (name)
      command = <<-SQL
        SELECT * FROM puppies
        WHERE name='#{name}';
      SQL
      @db.exec(command)
    end

    def delete(name)
      command1 = <<-SQL
        SELECT * FROM puppies
        WHERE name = '#{name}'
      SQL
      command = <<-SQL
        DELETE FROM puppies
        WHERE name = '#{name}'
      SQL
      pop_pup = @db.exec(command1)
      @db.exec(command)
      return pop_pup[0]
    end

    def drop_table
      command = <<-SQL
        DROP TABLE IF EXISTS puppies CASCADE;
      SQL
      @db.exec(command)
    end
  end
end