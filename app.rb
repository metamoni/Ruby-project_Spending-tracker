require("sinatra")
require("sinatra/contrib/all")
require_relative("./controllers/merchants_controller.rb")
require_relative("./controllers/tags_controller.rb")
require_relative("./controllers/transactions_controller.rb")
require_relative("./controllers/user_controller.rb")

get '/' do
  @transactions = Transaction.all()
  @user = User.new({"user_name" => "Mrs. O'Reilly", "budget" => 650, "transactions" => @transactions})
  erb(:index)
end
