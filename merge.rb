def merge(a, b)
	result = Array.new(a.length() + b.length())
	a_index = 0
	b_index = 0
	i = 0
	while (true)
		a_value = a[a_index]
		b_value = b[b_index]
		if (a_index < a.length() && (b_index >= b.length() || a_value <= b_value))
			result[i] = a_value
			a_index += 1
		else
			if (b_index < b.length())
				result[i] = b_value
				b_index += 1
			else
				break
			end
		end
		i += 1
	end
	return result
end

def mergesort(array)
	if array.length() <= 1
		return array
	end
	mid = array.length() / 2
	unsorted_a = array[0..mid - 1]
	unsorted_b = array[mid..array.length() - 1]
	a = mergesort(unsorted_a)
	b = mergesort(unsorted_b)
	return merge(a, b)
end

# puts mergesort([3,2]).inspect

puts mergesort([2,3,4,1]).inspect
