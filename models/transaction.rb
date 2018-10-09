require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id
  attr_accessor :value, :merchant_id, :tag_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @value = options["value"].to_f
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end


  def save()
    sql = "INSERT INTO transactions (value, merchant_id, tag_id) VALUES ($1, $2, $3) RETURNING id;"
    results = SqlRunner.run(sql, [@value, @merchant_id, @tag_id])
    @id = results.first()["id"].to_i
  end


  def self.all()
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end


  def update()
    sql = "UPDATE transactions SET (value, merchant_id, tag_id) = ($1, $2, $3) WHERE id = $4;"
    SqlRunner.run(sql, [@value, @merchant_id, @tag_id, @id])
  end


  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end


  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = $1;"
    SqlRunner.run(sql, [id])
  end


  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1;"
    result = SqlRunner.run(sql, [id]).first
    return Transaction.new(result)
  end


  def tag()
    sql = "SELECT * FROM tags WHERE id = $1;"
    results = SqlRunner.run(sql, [@tag_id])
    return Tag.new(results.first)
  end


  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1;"
    results = SqlRunner.run(sql, [@merchant_id])
    return Merchant.new(results.first)
  end

end
