class Node
	attr_accessor :next, :element
	def initialize(element)
		@element = element
		@next = nil
	end
end

class LinkedList
	attr_accessor :head
	def initialize(node = nil)
		@head = node
	end
	def insert(element, index)
		fail if index < 0
		node = Node.new(element)
		if index == 0
			node.next = @head
			@head = node
			return
		end
		idx = 1
		prev = @head
		while (idx < index && prev.next != nil)
			prev = prev.next
		end
		node.next = prev.next
		prev.next = node
	end

	def contains_cycle
		return false unless @head
		slow = @head
		fast = @head
		while (true)
			return false unless slow.next
			slow = slow.next
			return false unless fast.next && fast.next.next
			fast = fast.next.next
			return true if slow == fast
		end
	end

	def to_s
		if self.contains_cycle
			return 'cycle'
		end
		s = ''
		node = @head
		while (node != nil)
			s += node.element.to_s + ', '
			node = node.next
			puts ''
		end
		s += 'end'
		return s
	end
end

list = LinkedList.new
list.insert(1, 0)
list.insert(2, 0)
list.insert(3, 2)
list.insert(4, 0)

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')

a.next = b
b.next = c
c.next = d
d.next = e
e.next = c

puts list.to_s
cycleList = LinkedList.new(a)

puts cycleList.to_s