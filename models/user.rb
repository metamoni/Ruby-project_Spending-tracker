require_relative("../db/sql_runner.rb")

class User

  attr_reader :id, :name
  attr_accessor :account_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @account_id = options["account_id"].to_i
  end

  

end
