for i in 1..100
	if (i % 3 == 0)
		print 'fizz'
	end
	if (i % 5 == 0)
		print 'buzz'
	end
	if (i % 3 != 0 && i % 5 != 0)
		print i
	end
	puts
end