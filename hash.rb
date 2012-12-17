#test uniqueness of chars in string
def has_unique_chars?(str)
	# counts = {}
	# for char in str.chars
	# 	if counts[char]
	# 		return false
	# 	else
	# 		counts[char] = true
	# 	end
	# end
	# return true

	sorted_chars = str.chars.sort { |a, b| a <=> b }
	last_char = nil
	for char in sorted_chars
		if char == last_char
			return false
		else
			last_char = char
		end
	end
	puts str
	return true

end

#true
puts has_unique_chars?('cba')

#false
puts has_unique_chars?('hello')