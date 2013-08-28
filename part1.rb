
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
  formattedString = string.gsub(/[^a-z^A-Z]/, " ").downcase
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


def sort_projects(p)
  #p is an array of projects
  #p[0].lang = "Ruby"
  @projects = Hash.new
  p.each do |project|
    if !@projects.has_key? project.lang
      @projects["#{project.lang}"] = Array.new
    end
      @projects["#{project.lang}"] << project
  end

end
