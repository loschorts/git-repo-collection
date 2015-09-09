class Fixnum
	@@ones = %w["" one two three four five six seven eight nine]
	@@tens = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
	@@decs = %w["" one twenty thirty forty fifty sixty seventy eighty ninety]
	@@magnitude = %w["" thousand million billion trillion]

	def in_words
		return "zero" if self == 0

		num = self
		mag_index = 0
		num_string = ""

		while num > 0
			num_string = words_sub_1000(num % 1000) + " " + "#{@@magnitude[mag_index] if mag_index !=0}" + " " + num_string if num % 1000 != 0
			num /= 1000
			mag_index +=1
		end

		num_string.gsub(/\W/," ").gsub(/\s+/, " ").strip

	end

	def words_sub_1000 num

		hundreds_digit = num / 100
		tens_digit = num % 100 / 10
		ones_digit = num % 10

		num_string = ""

		num_string << @@ones[hundreds_digit] + " hundred " if hundreds_digit != 0

		if tens_digit == 0
			num_string << @@ones[ones_digit]
		elsif tens_digit == 1
			num_string << @@tens[ones_digit]
		else
			num_string << @@decs[tens_digit] + " "
			num_string << @@ones[ones_digit]
		end

		num_string
	end

end

p 123456887756.in_words




