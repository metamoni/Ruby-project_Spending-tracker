require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id
  attr_accessor :value, :merchant_id, :tag_id

  def initialize(options)
    @id = options["id"].to_i
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


  def delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM transactions WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

end
