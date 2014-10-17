

class PigLatin

	@@vowels = ['a', 'e', 'i', 'o', 'u']

	def self.english_to_pig(text)
		chunks = text.split /\b/
		chunks.map { |chunk| chunk =~ /[A-z]/ ? self.translate_word(chunk) : chunk }.join
	end

	def self.translate_word(word)
		@@vowels.include?(word[0]) ? word + "ay" : self.translate_word_beginning_with_consonant(word)
	end

	private 

		def self.translate_word_beginning_with_consonant(word)
			first_consonants, remainder = word.match(/([^aeiou]+)(.*)/i).captures

			pig_word = remainder + first_consonants + "ay"
			
			word[0] == word[0].upcase ? pig_word.capitalize! : pig_word
		end

end



describe PigLatin do

	describe "translating from english to pig latin" do 

		context "when given a word that starts with a consonant" do

			it "should remove the first letter and append it along with 'ay'" do
				expect(PigLatin.english_to_pig("hello")).to eq "ellohay"
				expect(PigLatin.english_to_pig("world")).to eq "orldway"
			end

			it "capitalizes the pig latin when the English is capitalized" do
				expect(PigLatin.english_to_pig("World")).to eq "Orldway"
			end

			it "should remove all the consonants before the first vowel and append them with ay" do
				expect(PigLatin.english_to_pig("brown")).to eq "ownbray"
			end

		end

		context "when given a word that starts with a vowel" do

			it "should append ay" do
				expect(PigLatin.english_to_pig("apples")).to eq "applesay"
			end

		end

		context "when given a sentence" do
			it "should translate each word and preserve spaces" do
				expect(PigLatin.english_to_pig("hello world")).to eq "ellohay orldway"
			end

			it "should preserve punctuation" do 
				expect(PigLatin.english_to_pig("eat... apples?")).to eq "eatay... applesay?"
			end

		end

	end
end
