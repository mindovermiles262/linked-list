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
	

end
