class LinkedList
    def initialize
        @head = Node.new("head", nil)
    end

    # add new node to end of the list
    def append(value)

    end

    # add new node to the start of the list
    def prepend(value)

    end

    # returns the total number of nodes in the list
    def size

    end

    # returns the first node in the list
    def head

    end

    # returns the last node in the list
    def tail

    end

    # returns the node at the given index
    def at(index)

    end

    # removes the last element from the list
    def pop

    end

    # returns true if the passed value in list, else returns false
    def contains?

    end

    # returns the index of the node containing data, or nil if not found
    def find(data)

    end

    # convert LinkedList to string class.
    # Format: `( data ) -> ( data ) -> (data ) -> nil`
    def to_s

    end
end

class Node
    attr_accessor :value, :next_node
    def initialize value = nil, next_node = nil
        @value = value
        @next_node = next_node
    end
end