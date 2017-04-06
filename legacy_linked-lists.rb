class LinkedList
    def initialize
        @head = Node.new("head", nil)
    end

    # add new node to end of the list
    def append(value)
        self.tail.next_node = Node.new(value, nil)
    end

    # add new node to the start of the list
    def prepend(value)
        @head.next_node = Node.new(value, @head.next_node)
    end

    # returns the total number of nodes in the list
    def size
        if @head.next_node                  # check for items in list
            node = @head.next_node
            i = 1
            while node.next_node
                node = node.next_node
                i += 1
            end
            return i
        else
            return 0        # no items in list
        end
    end

    # returns the first node in the list
    def head
        @head
    end

    # returns the last node in the list
    def tail
        if @head.next_node
            node = @head.next_node
            while node.next_node
                node = node.next_node
            end
            node
        else
            @head       # list is 1 item long
        end
    end

    # returns the node at the given index
    def at(index)
        if @head.next_node
            node = @head.next_node
            i = 0
            until i == index
                node = node.next_node
                i += 1
            end
            return node
        else
            return nil
        end
    end

    # removes the last element from the list
    def pop
        if @head.next_node
            node = @head.next_node
            while node.next_node.next_node      # look two items down list
                node = node.next_node
            end
            popped = node.next_node     # save pop value
            node.next_node = nil        # clear tail
            return popped
        else
            return nil
        end
    end

    # returns true if the passed value in list, else returns false
	def contains?(value)
        if @head.value == value
            return true
		elsif @head.next_node
			node = @head.next_node
			while node.next_node
				if node.value == value
					return true
				else
					node = node.next_node
				end
			end
			return false
		else
			return false
		end
	end

    # returns the index of the node containing data, or nil if not found
    def find(data)
        if @head.value == data
            return 0
        elsif @head.next_node
            node = @head.next_node
            i = 1
            while node.next_node
                if node.value == data
                    return i
                else
                    node = node.next_node
                    i += 1
                end
            return nil
            end
        else
            return nil
        end
    end

    # convert LinkedList to string class.
    # Format: `( data ) -> ( data ) -> (data ) -> nil`
    def to_s
        if @head.next_node
            str = "( #{@head.next_node.value} ) ->"
            node = @head.next_node
            while node.next_node
                str += "( #{nose.next_node.value} ) ->"
                node = node.next_node``
            end
            str += ' nil'
            return str
        else
            return nil
        end
    end
    
end


class Node
    attr_accessor :value, :next_node
    def initialize value = nil, next_node = nil
        @value = value
        @next_node = next_node
    end
end