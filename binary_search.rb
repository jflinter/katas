def binary_search(array, element)
	return nil unless array.is_a? Array
	return binary_search_with_indices(array, element, 0, array.length() - 1)
end

def binary_search_with_indices(array, element, start, finish)
	return nil if start > finish
	mid = (start + finish) / 2
	return mid if array[mid] == element
	return binary_search_with_indices(array, element, start, mid-1) if array[mid] > element
	return binary_search_with_indices(array, element, mid+1, finish) if array[mid] < element
end

fail unless binary_search([1,2,3], 2) == 1
fail unless binary_search([1,2,3,4], 2) == 1
fail unless binary_search([1,2,3], 4) == nil
fail unless binary_search([1,2,3], 3) == 2
fail unless binary_search([-1,2,5,9,10], 5) == 2