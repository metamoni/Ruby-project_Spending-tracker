require_relative("../db/sql_runner.rb")

class Tag

  attr_reader :id
  attr_accessor :name, :description, :icon

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @description = options["description"]
    @icon = options["icon"]
  end


  def save()
    sql = "INSERT INTO tags (name, description, icon) VALUES ($1, $2, $3)
    RETURNING id;"
    @id = SqlRunner.run(sql, [@name, @description, @icon]).first()["id"].to_i
  end


  def self.all()
    sql = "SELECT * FROM tags;"
    tags = SqlRunner.run(sql)
    return tags.map { |tag| Tag.new(tag) }
  end


  def update()
    sql = "UPDATE tags SET (name, description, icon) = ($1, $2, $3) WHERE id = $4;"
    SqlRunner.run(sql, [@name, @description, @icon, @id])
  end


  def self.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM tags WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1;"
    result = SqlRunner.run(sql, [id]).first
    return Tag.new(result)
  end


  def merchant()
    sql = "SELECT merchants.* FROM merchants INNER JOIN transactions ON transactions.merchant_id = merchants.id WHERE transactions.tag_id = $1;"
    results = SqlRunner.run(sql, [@id])
    return results.map { |merchant| Merchant.new(merchant) }
  end

end
