def add(num1, num2)
	num1+num2
end

def subtract(num1, num2)
	num1-num2
end

def sum(nums)
	nums.inject(0){|sum, num| sum + num}
end

def multiply(*factors)
	factors.inject(1){|product, factor| product * factor}
end
def power(base, exp)
	base ** exp

end
def factorial(num)
	1.upto(num).inject(1){|factorial, factor| factorial * factor}
end