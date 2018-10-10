require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id
  attr_accessor :value, :merchant_id, :tag_id, :date_and_time

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @value = options["value"].to_f
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
    @date_and_time = options["date_and_time"]
  end


  def save()
    sql = "INSERT INTO transactions (value, merchant_id, tag_id, date_and_time) VALUES ($1, $2, $3, $4) RETURNING id;"
    results = SqlRunner.run(sql, [@value, @merchant_id, @tag_id, @date_and_time])
    @id = results.first()["id"].to_i
  end


  def self.all()
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end


  def update()
    sql = "UPDATE transactions SET (value, merchant_id, tag_id, date_and_time) = ($1, $2, $3, $4) WHERE id = $5;"
    SqlRunner.run(sql, [@value, @merchant_id, @tag_id, @id, @date_and_time])
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


  def self.total_spent()
    total = 0
    for transaction in Transaction.all()
      total += transaction.value
    end
    return total.round(2)
  end

  def self.sort_by_oldest()
    sql = "SELECT * FROM transactions
    ORDER BY date_and_time ASC;"
    SqlRunner.run(sql)
  end

end
