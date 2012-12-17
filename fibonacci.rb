class FibonacciGenerator
	def initialize
		@cache = {}
	end
	def numberAtIndex(n)
		fail unless n > 0
		return @cache[n] if @cache[n]
		return 1 if n == 1 or n == 2
		@cache[n] = numberAtIndex(n-1) + numberAtIndex(n-2)
	end
end