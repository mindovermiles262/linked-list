require "linked_list"
require "node"

describe "Node" do
	it "initializes defaults to nil" do
		node = Node.new
		expect(node.value).to eql(nil)
		expect(node.next_node).to eql(nil)
	end

	it "initializes with values" do
		node = Node.new(22, "next")
		expect(node.value).to eql(22)
		expect(node.next_node).to eql("next")
	end
end

describe "LinkedList" do

		before do
			@list = LinkedList.new
		end
		
	describe "#initialize" do
		it "creats a head node" do
			expect(@list.head).to be_a(Node)
		end
	end
	
	describe "#append" do
		before do
			@list.append(4)
		end
		
		it "adds first node" do
			expect(@list.head.next_node.value).to eql(4)
		end

		it "adds additional nodes" do
			@list.append(6)
			expect(@list.head.next_node.next_node.value).to eql(6)
		end
		
	end
	
	describe "#prepend" do
		before do
			@list.prepend(2)
		end
		
		it "adds to the beginning of the list" do
			expect(@list.head.next_node.value).to eql(2)
		end
		it "adds additional nodes to beginning of list" do
			@list.prepend(1)
			expect(@list.head.next_node.value).to eql(1)
		end
	end

	describe "#size" do
		it "returns 0 if empty" do
			expect(@list.size).to eql(0)
		end
		
		it "returns one node" do
			@list.append(1)
			expect(@list.size).to eql(1)
		end

		it 'returns three nodes' do
			@list.append(3)
			@list.append(4)
			@list.append(6)
			expect(@list.size).to eql(3) 
		end

	end
	

end
