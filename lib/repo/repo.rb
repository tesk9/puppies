require 'pg'
module PuppyBreeder::Repo
  class Repo
    def initialize
      @db = PG.connect(dbname: 'puppy-breeder-db')
    end
  end
end

require_relative 'breed_repo.rb'
require_relative 'puppy_repo.rb'
require_relative 'purchase_request_repo.rb'
