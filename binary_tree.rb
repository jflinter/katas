class Node
	attr_accessor :left, :right, :parent, :element
	def initialize(left=nil, right=nil, parent = nil, element=nil)
		@left = left
		@right = right
		@parent = parent
		@element = element
	end
	def insert(node)
		if node.element < @element
			if (@left)
				return @left.insert(node)
			else
				node.parent = @
				@left = node
				return node
			end
		else
			if (@right)
				return @right.insert(node)
			else
				node.parent = @
				@right = node
				return node
			end
		end
	end

	def to_s
		@element.to_s
	end

end

class BinaryTree
	attr_accessor :root, :nodes
	def initialize
		@root = nil
	end
	def insert(element)
		node = Node.new(nil, nil, nil, element)
		if (!@root)
			@root = node
			return @root
		else
			return @root.insert(node)
		end
	end

	def search(value, node=@root)
		return nil if !node
		return node if node.element == value
		if value < node.element
			return search(value, node.left)
		else
			return search(value, node.right)
		end
	end

	def delete(value)
		nodeToDelete = search(value)
		if (nodeToDelete)
			if (nodeToDelete.left)
				
			if nodeToDelete.parent
			if nodeToDelete = nodeToDelete.parent.left
		end

	def bfs(&block)
		queue = [@root]
		while (!queue.empty?)
			node = queue.shift
			queue << node.left if node.left
			queue << node.right if node.right
			yield node
		end
	end

	def visit(node, order, &block)
		return unless node
		case order
		when :preorder
			yield node
			visit(node.left, order, &block)
			visit(node.right, order, &block)
		when :inorder
			visit(node.left, order, &block)
			yield node
			visit(node.right, order, &block)
		when :postorder
			visit(node.left, order, &block)
			visit(node.right, order, &block)
			yield node

		end
	end
	def clear
		@root = nil
	end

end

tree = BinaryTree.new
[3,1,2,4].each {|i| tree.insert(i) }
puts tree.search(10)