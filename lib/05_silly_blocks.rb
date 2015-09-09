def reverser &code_block
	code_block.call
	.split.map{|word| word.reverse}
	.join(" ")
end

def adder num=1, &code_block
	code_block.call + num
end

def repeater times=1, &code_block
	times.times {code_block.call}
end
