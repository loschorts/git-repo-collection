class Temperature

	def self.from_celsius celsius
		self.new(:c => celsius) 
	end

	def self.from_fahrenheit fahrenheit
		self.new(:f => fahrenheit)
	end

	def self.ftoc f
		return (f.to_f - 32) * 5/9
	end

	def self.ctof c
		return c.to_f * 9/5 + 32
	end

	def initialize(options = {})
		@temp_f = options[:f]
		@temp_c = options[:c]
		@temp_f = ctof(@temp_c) if @temp_f.nil?
		@temp_c = ftoc(@temp_f) if @temp_c.nil?

	end

	def in_fahrenheit
		@temp_f
	end

	def in_celsius
		@temp_c
	end

end

class Celsius < Temperature
	def initialize degrees
		super c: degrees
	end
end

class Fahrenheit < Temperature
	def initialize degrees
		super f: degrees
	end
end

