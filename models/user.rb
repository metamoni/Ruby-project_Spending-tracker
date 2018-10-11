require_relative("../db/sql_runner.rb")

class User

  attr_reader :id
  attr_accessor :user_name, :budget

  def initialize(options)
    @id = options["id"].to_i,
    @user_name = options["user_name"],
    @budget = options["budget"]
  end


  def save()
    sql = "INSERT INTO users (user_name, budget) VALUES ($1, $2)
    RETURNING id;"
    results = SqlRunner.run(sql, [@user_name, @budget])
    @id = results.first()["id"].to_i
  end


  def total_spent()
    total = 0
    Transaction.all().each { |transaction| total += transaction.value }
    return total.round(2)
  end


  def budget_status()
    remaining = @budget - total_spent().round(2)

    if remaining == 0
      "You've spent all your money!"
    elsif remaining < 0
      "You've spent more than you can afford"
    elsif remaining < (@budget * 0.3)
      "I hate to break this to you, but hour funds are running low"
    else
      "Your finances are lookin' good!"
    end
  end


  def self.delete_all()
    sql = "DELETE FROM users;"
    SqlRunner.run(sql)
  end

end
