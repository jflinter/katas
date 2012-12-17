class HashTable
	
	TABLE_SIZE = 1000
	attr_accessor :buckets
	def initialize
		@buckets = Array.new(TABLE_SIZE, [])
	end

	def put(key, value)
		index = key.hash % TABLE_SIZE
		bucket = @buckets[index]
		for entry in bucket
			if entry.key.eql? key
				entry.value = value
				return
			end
		end
		bucket.push(HashEntry.new(key,value))
	end

	def get(key)
		index = key.hash % TABLE_SIZE
		bucket = @buckets[index]
		for entry in bucket
			if entry.key.eql? key
				return entry.value
			end
		end
		return nil
	end

end

class HashEntry
	attr_accessor :key, :value
	def initialize(key, value)
		@key = key
		@value = value
	end
end