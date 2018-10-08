require_relative("../db/sql_runner.rb")

class Merchant

  attr_reader :id
  attr_accessor :name, :tag_id

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @tag_id = options["tag_id"].to_i
  end


  def save()
    sql = "INSERT INTO merchants (name, tag_id) VALUES ($1, $2)
    RETURNING id;"
    @id = SqlRunner.run(sql, [@name, @tag_id]).first()["id"].to_i
  end


  def self.all()
    sql = "SELECT * from merchants;"
    merchants = SqlRunner.run(sql)
    return merchants.map { |merchant| Merchant.new(merchant) }
  end


  def update()
    sql = "UPDATE merchants SET (name, tag_id) = ($1, $2) WHERE id = $3;"
    SqlRunner.run(sql, [@name, @tag_id, @id])
  end


  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM merchants WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

end
