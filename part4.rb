class Dessert 

  attr_accessor :name
  attr_accessor :calories
	
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
	
  def healthy?
    return false unless @calories < 200
    true
  end
  


  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def delicious?
    return true unless @flavor == "black licorice"
    return false
  end
end

puts "OBJECT ORIENTATION"
dessert = Dessert.new 'apple', 100
puts "New dessert => "+ dessert.inspect
puts "The name is "+dessert.name
puts "Is the dessert healthy?"
puts dessert.healthy?
puts "But is it delicious?"
puts dessert.delicious?


