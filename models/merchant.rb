require_relative("../db/sql_runner.rb")

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end


  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1)
    RETURNING id;"
    @id = SqlRunner.run(sql, [@name]).first()["id"].to_i
  end


  def self.all()
    sql = "SELECT * from merchants;"
    merchants = SqlRunner.run(sql)
    return merchants.map { |merchant| Merchant.new(merchant) }
  end


  def update()
    sql = "UPDATE merchants SET (name) = ($1) WHERE id = $2;"
    SqlRunner.run(sql, [@name, @id])
  end


  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM merchants WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1;"
    result = SqlRunner.run(sql, [id]).first
    return Merchant.new(result)
  end


  def tag()
    sql = "SELECT tags.* FROM tags INNER JOIN transactions ON transactions.tag_id = tags.id WHERE transactions.merchant_id = $1;"
    results = SqlRunner.run(sql, [@id])
    return results.map { |tag| Tag.new(tag) }
  end


end
