require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id, :merchant_id, :tag_id
  attr_accessor :value

  def initialize(options)
    @id = options["id"].to_i
    @value = options["value"].to_f
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end



end
