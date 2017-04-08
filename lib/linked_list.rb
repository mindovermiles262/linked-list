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
		while location.next_node.next_node != nil
			location = location.next_node
		end
		last = location.next_node
		location.next_node = nil
		return last
		location = @head
	end

	def contains?(search)
		if @head.value == search
			return true
		elsif @head.next_node != nil
			location = @head.next_node
			while location.next_node != nil
				if location.value == search
					return true
				else
					location = location.next_node
				end
			end
			return false
		end
	end
	
	def find(search)
		if @head.next_node != nil
			i = 0
			location = @head.next_node
			while location.next_node != nil
				if location.value == search
					return i
				else
					location = location.next_node
					i += 1
				end
			end
		else
			return nil
		end	
	end

	def to_s
		str = ""
		if @head.next_node != nil
			location = @head.next_node
			while location.next_node != nil
				str += "( #{location.value} ) -> "
				location = location.next_node
			end
			str += "( #{location.value} ) -> nil"
		else
			str = "nil"
		end
	end
	
end
