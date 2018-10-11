require_relative("../db/sql_runner.rb")

class User

  attr_reader :id
  attr_accessor :user_name, :budget, :transactions

  def initialize(options)
    @id = options["id"].to_i,
    @user_name = options["user_name"],
    @budget = options["budget"],
    @transactions = Transaction.all()
  end


  def save()
    sql = "INSERT INTO users (user_name, budget) VALUES ($1, $2)
    RETURNING id;"
    results = SqlRunner.run(sql, [@user_name, @budget])
    @id = results.first()["id"].to_i
  end


  def total_spent()
    total = 0
    @transactions.each { |transaction| total += transaction.value }
    return total.round(2)
  end


  def budget_status()
    amount_spent = total_spent()

    case amount_spent
    when @budget == amount_spent
      "You've wasted all your budget"
    when @budget < (amount_spent * 0.3)
      "Careful now! Your funds are running low"
    when @budget < amount_spent
      "You've spent more than you can afford"
    else
      "Lookin' good!"
    end
  end

  def self.delete_all()
    sql = "DELETE FROM users;"
    SqlRunner.run(sql)
  end

end
