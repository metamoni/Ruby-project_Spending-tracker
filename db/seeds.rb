require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require("pry-byebug")

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()


tag1 = Tag.new({
  "name" => "Food stuffs",
  "description" => "All those things necessary to eat and drink your problems away",
  "icon" => "https://www.shareicon.net/download/2016/09/09/827452_commerce_512x512.png"
  })

tag1.save()


tag2 = Tag.new({
  "name" => "Entertainment",
  "description" => "Games, books & other vital things to help you escape reality",
  "icon" => "https://cdn2.iconfinder.com/data/icons/circle-icons-1/64/gamecontroller-512.png"
  })

tag2.save()


tag3 = Tag.new({
  "name" => "Travel",
  "description" => "Up your Instagram game while ignoring emails and phone calls",
  "icon" => "https://www.shareicon.net/download/2016/09/09/827403_global_512x512.png"
  })

tag3.save()


tag4 = Tag.new({
  "name" => "Fun times",
  "description" => "Pretend to enjoy yourself and have the purchase history to prove it",
  "icon" => "https://cdn2.iconfinder.com/data/icons/ballicons-2-free/100/theatre-512.png"
  })

tag4.save()


merchant1 = Merchant.new({
  "name" => "Vogon Constructor Fleet"
  })

merchant1.save()


merchant2 = Merchant.new({
  "name" => "The Blue Midget"
  })

merchant2.save()


merchant3 = Merchant.new({
  "name" => "RMS Titanic"
  })

merchant3.save()


merchant4 = Merchant.new({
  "name" => "Restaurant at the end of the Universe"
  })

merchant4.save()


merchant5 = Merchant.new({
  "name" => "Waynestock"
  })

merchant5.save()


merchant6 = Merchant.new({
  "name" => "Bend-Aid benefit concert"
  })

merchant6.save()


merchant7 = Merchant.new({
  "name" => "Interdimensional cable"
  })

merchant7.save()


merchant8 = Merchant.new({
  "name" => "Black Books"
  })

merchant8.save()


merchant9 = Merchant.new({
  "name" => "Curse Purge Plus"
  })

merchant9.save()


merchant10 = Merchant.new({
  "name" => "The Quick Stop"
  })

merchant10.save()


merchant11 = Merchant.new({
  "name" => "Ogrimmar General Store"
  })

merchant11.save()


merchant12 = Merchant.new({
  "name" => "Nabootique"
  })

merchant12.save()


transaction1 = Transaction.new({
  "value" => 7.2,
  "merchant_id" => merchant10.id,
  "tag_id" => tag1.id
  })

transaction1.save()


transaction2 = Transaction.new({
  "value" => 32,
  "merchant_id" => merchant9.id,
  "tag_id" => tag2.id
  })

transaction2.save()


transaction3 = Transaction.new({
  "value" => 153.79,
  "merchant_id" => merchant2.id,
  "tag_id" => tag3.id
  })

transaction3.save()


transaction4 = Transaction.new({
  "value" => 20,
  "merchant_id" => merchant6.id,
  "tag_id" => tag4.id
  })

transaction4.save()


transaction5 = Transaction.new({
 "value" => 12.3,
  "merchant_id" => merchant8.id,
  "tag_id" => tag2.id
  })

transaction5.save()


transaction6 = Transaction.new({
  "value" => 26.5,
   "merchant_id" => merchant4.id,
   "tag_id" => tag4.id
  })

transaction6.save()


transaction7 = Transaction.new({
  "value" => 7.99,
   "merchant_id" => merchant7.id,
   "tag_id" => tag2.id
  })

transaction7.save()


transaction8 = Transaction.new({
  "value" => 17.5,
   "merchant_id" => merchant12.id,
   "tag_id" => tag1.id
  })

transaction8.save()


binding.pry
nil
