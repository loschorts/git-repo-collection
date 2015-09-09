class Dictionary
	attr_reader :entries

	def initialize(entries = {})
		@entries = entries
	end

	def keywords
		@entries.keys.sort
	end

	def add(*entries)
		entries.each do |entry|
			@entries = @entries.merge(entry) if entry.class == Hash
			@entries[entry] = nil if entry.class == String
		end
	end

	def include?(key)
		@entries.include?(key)
	end

	def find(key)
		@entries.select {|word| word.start_with?(key)}
	end

	def printable
		@entries.sort.inject("") do |output, (key, val)|
			output << "[#{key}] \"#{val}\"\n"
		end
		.chomp
	end
end
