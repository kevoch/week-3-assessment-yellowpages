require_relative '../config/application.rb'
require_relative '../app/models/list.rb'
require "sqlite3"
require 'byebug'


#  List.create(name:"Ping", phone: "0123456789", address: "Jalan SS 1")
# List.create(name:"Holloway", phone: "0129875433", address: "Jalan SS 9")


def list
  a = List.all
  a.each do |x|
  
    puts "#{x.id}  #{x.name}  #{x.phone}  #{x.address} " 
   
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





