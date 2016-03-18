# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'


# Your Code begins from this line onwards #
require_relative 'config/application.rb'
require_relative 'app/models/list.rb'
require "sqlite3"
require 'byebug'


#  List.create(name:"Ping", phone: "0123456789", address: "Jalan SS 1")
# List.create(name:"Holloway", phone: "0129875433", address: "Jalan SS 9")













def list 
  a = List.all
  puts "ID".ljust(4)+ "Name".ljust(15) + "Phone".ljust(15) + "Address".ljust(20)
  puts "===".ljust(4) + "====".ljust(15) + "=====".ljust(15) + "=======".ljust(20)
  a.each do |x|
  
    puts "#{x.id}.".ljust(4) + "#{x.name}".ljust(15) + "#{x.phone}".ljust(15) + "#{x.address}".ljust(20) 
   
  end
  
end

def add(name, phone, address)
  List.create(name: name, phone: phone, address: address)
end


def update(id, name, phone, address)
 all_id = []
 List.all.each do |x|
    all_id << x.id
    end

    if (all_id.include? id) == false
      puts "Uhh-ohhh... I cant find that user ID! Are you sure that is the right id?"
    else
      all = List.where(id: id)
      person = all[0]
      person.name = name
      person.phone = phone
      person.address = address
      
      person.save
    end
end

def delete(id)
  all_id = []
  List.all.each do |x|
    all_id << x.id
    end

  if (all_id.include? id) == false  
   puts "Uhh-ohhh... I cant find that user ID! Are you sure that is the right id?"
  else
    a = List.where(id: id)
    person = a[0]
    person.destroy
  end

end




if ARGV[0] == "list"
 list
elsif ARGV[0] == "add"
  add(ARGV[1],ARGV[2],ARGV[3])
elsif ARGV[0] == "delete"
  delete(ARGV[1].to_i)
elsif ARGV[0] == "update"
  update(ARGV[1].to_i,ARGV[2],ARGV[3],ARGV[4])
end

# hash = [:id,:name,:phone,:address,:company,:favourite_pokemon]
# def new_add(hash={})
#   hash.symbolize_keys!
#   # id = hash.fetch[:id]
#   # name = hash.fetch[:name]
#   # phone = hash.fetch[:phone]
#   # address = hash.fetch[:address]
#   # company = hash.fetch[:company]
#   # favourite_pokemon = hash.fetch[:favourite_pokemon]



  
#   all = list.where(id: id)
#   person = all[0]
#   person.name = name
#   person.phone = phone
#   person.address = address
#   person.company = company
#   person.favourite_pokemon = favourite_pokemon

#   person.save
# end


# new_add(id:2,company:"Next")