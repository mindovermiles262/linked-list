require_relative "./node"

class LinkedList
	attr_accessor :size, :head, :tail

	def initialize
		@head = Node.new("head", nil)
		#@tail = @head
	end


	# adds a new node to end of the list
	def append(value)
		self.tail.next_node = Node.new(value, nil)
	end


	# adds a new node to the beginning of the list
	def prepend(value)
		@head.next_node = Node.new(value, @head.next_node)
	end


	# Returns the total number of nodes in the list
	def size
		if @head.next_node != nil
			n = 1
			node = @head.next_node
			while node.next_node != nil
				n += 1
				node = node.next_node
			end
			return n
		else
			return 0
		end
	end


	# Returns the first node of the list
	def head
		@head
	end

	# Returns the last node of the list
	def tail
		if @head.next_node != nil
			node = @head.next_node
			while node.next_node != nil
				node = node.next_node
			end
			node
		else
			@head
		end
	end


	# Returns the node at the given index
	def at(index)
		location = @head.next_node
		(index).times do
			location = location.next_node
		end
		location
	end	


	# Removes the last element from the list
	def pop
		location = @head.next_node
		self.size-2.times do
			location = location.next_node
		end
		last = location.dup
		location.next_node = nil
		return last
	end


end
