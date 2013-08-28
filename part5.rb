class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{                   #make a string to evaluate into a couple of methods
      def #{attr_name}=(attr_val)
        @#{attr_name} = attr_val 
        if @#{attr_name}_history
          #{attr_name}_history << @#{attr_name}
        else
          @#{attr_name}_history = [nil, attr_val]
        end
      
      end
    }
  end
end

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def rupees
    self*0.019
  end
  
  def euros
    self*1.292
  end

  def yen
    self*0.013
  end
  def in(target)
    target = target.to_s
    target = target.downcase.gsub(/s$/, '');
    if @@currencies.has_key? target
        self/@@currencies[target]
    end
  end
end

puts "DOLLAZ AND SENSE"
puts "One dollar =>" + 1.dollar.to_s
puts "One dollar in yen =>" + 1.dollar.in(:yen).round(2).to_s
puts ""

class String
    def palindrome?
      test1= self.gsub(/[^a-z^A-Z]/, "").downcase
      test2 =test1.reverse 
      if(test1 ==test2)
        true
      else false
      end
    end
end
puts "STRINGS"
puts "Is hello a palindrome?"
puts "hello".palindrome?
puts "How about racecar?"
puts "racecar".palindrome?
puts ""

module Enumerable
  def palindrome?
    if self.respond_to? :reverse
      test = self.reverse 
      if test == self
        true
      else
        false
      end
    end
  end
end
#hash = {:a => "sup", :b => "girl", :a => "sup"}
array = [5, 6, 7, 6, 5]
other_array = [5, 6, 10, 500]
puts "ENUMBERABLES"
puts "Is  [5, 6, 7, 6, 5] a palindrome?"
puts array.palindrome?.to_s
puts "How about  [5, 6, 10, 500]?"
puts other_array.palindrome?.to_s

