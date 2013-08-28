puts "========  Everything is an Object  ==========="
puts "The number fifty seven's class => " + 57.class.to_s
57.methods.each do |method| 
  puts method.class.methods unless ((57.methods.index method) > 5)
end 
