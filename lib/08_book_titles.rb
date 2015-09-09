class Book
	attr_accessor :title

	def title= (title)
		keep_low = %w[the a an of and in]
		@title = title.capitalize.split
		.map {|word| keep_low.include?(word) ? word : word.capitalize}
		.join(" ")
	end
	
end