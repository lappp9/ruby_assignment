
def palindrome?(string)
  string = string.gsub(/[^a-z^A-Z]/, "").downcase
  string2 = string.reverse
  if(string2 == string)
    true
  else false
  end
end

def count_words(string)
  # alright the plan is to turn the string into an array at each space
  formattedString=string.gsub(/[^a-z^A-Z]/, " ").downcase
  array = formattedString.split(" ")
  hash = Hash.new
  
  # then do an iterator on the array that makes each element a hash key and adds 1 to that spot of the hash
  array.each do |word|
      if !hash.has_key? word
        hash["#{word}"] =1
      else
        hash["#{word}"]+=1
      end
  end
  return hash
end

class Fixnum
  def seconds; self; end
  def minutes; self*60; end
  def hours; self*60*60; end
  def days; self.hours*24; end
  def ago; Time.now-self; end
  def from_now; Time.now+self; end

  def method_missing(method_id, *args)
    name = method_id.to_s
    if name =~ /^second|hour|minute|day$/
        self.send name + 's'
    else
        super
    end

  end
end

puts "One day ago it was "+1.day.ago.to_s
