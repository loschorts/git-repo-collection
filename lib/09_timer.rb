class Timer
	attr_accessor :seconds
	def initialize(seconds = 0)
		@seconds = seconds
	end

	def time_string
		display = ""
		3.downto(1) do |exp|
			time = seconds % (60**exp) / (60**(exp-1))
			display << "0" if time < 10
			display << time.to_s+":"
		end
		display[0...-1]
	end
end
