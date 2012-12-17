def bubblesort(array)
	for i in 0..(array.length() - 1)
		swapped = false
		for j in 0..(array.length() - 2)
			a = array[j]
			b = array[j+1]
			swapped = a > b || swapped
			array[j] = [a,b].min
			array[j+1] = [a,b].max
		end	
		return array if !swapped
	end
	return array
end

puts bubblesort([4,5,6,1,2,3,7,9,8]).inspect