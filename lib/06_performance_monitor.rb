def measure(times=1, &code_block)
	results = []
	times.times do
		start = Time.now
		code_block.call
		finish = Time.now
		results << finish - start
	end
	results.inject{|sum, num| sum + num} / results.length
end