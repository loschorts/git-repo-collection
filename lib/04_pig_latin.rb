def translate(phrase)
	phrase.gsub(/[\w|']+/){ |word| do_word word }
end

def do_word(word)
	qu = /qu/ =~ word.downcase
	qu ? first_vowel = qu+2 : first_vowel = /[aeiou]/ =~ word.downcase

	first_vowel = 0 if first_vowel == nil
	new_word = word[first_vowel..-1] + word[0...first_vowel] + "ay"

	word == word.capitalize ? new_word.capitalize : new_word
end