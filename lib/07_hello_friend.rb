class Friend
	def greeting(friend = nil)
		friend.nil? ? "Hello!" : "Hello, #{friend}!"
	end
end
