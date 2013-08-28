def combine_anagrams(words)
  #make a temp array with all the words rearranged and sorted which gives you a list of all anagram possibilities
	tempArray = Array.new

	words.each do |word|
	  tempArray << word.downcase.chars.sort.join
	  tempArray = tempArray.sort
	end
	
	#then make a hash where each possibility is a key (only if the key doesn't already exist)
	hashedAnagrams = Hash.new

	tempArray.each do |anagram|
	  hashedAnagrams[anagram] = Array.new
	end 
	
	#iterate through the original array and put the element in its corresponding spot in the hash
	words.each do |word| 
	  targetSpot = word.downcase.chars.sort.join
	  hashedAnagrams[targetSpot] << word
	end
	
	#iterate one last time and push each sub array onto the final array
	finalArray = Array.new

	hashedAnagrams.each_value do |subArray|
	  finalArray << subArray
	end	
	
	return finalArray
end
