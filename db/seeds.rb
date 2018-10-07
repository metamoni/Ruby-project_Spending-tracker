require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require("pry-byebug")

Tag.delete_all()
Merchant.delete_all()
# Transaction.delete_all()

tag1 = Tag.new({
  "name" => "Food stuff",
  "icon" => "https://www.shareicon.net/download/2016/09/09/827452_commerce_512x512.png"
  })

tag1.save()


tag2 = Tag.new({
  "name" => "Pets",
  "icon" => "http://www.hopeanimalrescue.org/wp-content/uploads/2015/09/icon-dogs.png"
  })

tag2.save()


tag3 = Tag.new({
  "name" => "Travel",
  "icon" => "https://www.shareicon.net/download/2016/09/09/827403_global_512x512.png"
  })

tag3.save()


tag4 = Tag.new({
  "name" => "Party time",
  "icon" => "https://ubisafe.org/images/cocktail-vector-flat-4.png"
  })

tag4.save()


merchant1 = Merchant.new({
  "name" => "Ryanair",
  "tag_id" => tag3.id
  })

merchant1.save()


merchant2 = Merchant.new({
  "name" => "Scotrail",
  "tag_id" => tag3.id
  })

merchant2.save()


merchant3 = Merchant.new({
  "name" => "Chanter",
  "tag_id" => tag4.id
  })

merchant3.save()

binding.pry
nil
