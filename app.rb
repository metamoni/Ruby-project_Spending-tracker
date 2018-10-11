require("sinatra")
require("sinatra/contrib/all")
require_relative("./controllers/merchants_controller.rb")
require_relative("./controllers/tags_controller.rb")
require_relative("./controllers/transactions_controller.rb")
require_relative("./models/user.rb")

get '/' do
  @user = User.new({
    "user_name" => "Mrs. O'Reilly",
    "budget" => 750
    })
  erb(:index)
end
