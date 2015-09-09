def echo(phrase)
	phrase
end

def shout(phrase)
	phrase.upcase
end

def repeat(phrase, times = 2)
	("#{phrase} " * times).strip
end

def start_of_word (phrase, letters)
	phrase[0..letters-1]
end

def first_word (phrase)
	phrase.split[0]
end

def titleize (phrase)
	lowercase = %w[of the over and]
	phrase.capitalize.split.map do |word| 
		lowercase.include?(word) ? word : word.capitalize 
	end
	.join(" ")
end
