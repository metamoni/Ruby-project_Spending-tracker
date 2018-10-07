require_relative("../db/sql_runner.rb")

class Tag

  attr_reader :id
  attr_accessor :name, :icon

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @icon = options["icon"]
  end


  def save()
    sql = "INSERT INTO tags (name, icon) VALUES ($1, $2)
    RETURNING id;"
    @id = SqlRunner.run(sql, [@name, @icon]).first()["id"].to_i
  end


  def self.all()
    sql = "SELECT * FROM tags;"
    tags = SqlRunner.run(sql)
    return tags.map { |tag| Tag.new(tag) }
  end


  def update()
    sql = "UPDATE tags SET (name, icon) = ($1, $2) WHERE id = $3;"
    SqlRunner.run(sql, [@name, @icon, @id])
  end


  def self.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM tags WHERE id = $1;"
    SqlRunner.run(sql, @id)
  end

end
