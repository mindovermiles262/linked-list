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
	
	describe "#tail" do
		it "returns head if list is empty" do
			expect(@list.tail.value).to eql("head")
		end
		
		it 'returns value of last node' do
			@list.append(4)
			expect(@list.tail.value).to eql(4)
		end

		it 'works with 2+ nodes' do
			@list.append(3)
			expect(@list.tail.value).to eql(3)
		end
	end
	
	describe '#at(index)' do
		context 'with an empty list' do
			it 'returns nil' do
				expect(@list.at(0)).to eql(nil)
			end
		end
		
		context 'with a list of three' do
			before do
				@list.append(5)
				@list.append(10)
				@list.append(15)
			end
			
			it 'returns value at index' do
				expect(@list.at(2).value).to eql(15)
			end

			it 'returns nil if index outside rainge' do
				expect(@list.at(3)).to eql(nil)
			end
		end
	end

	describe '#pop' do
		before do
			@list.append(2)
			@list.append(4)
			@list.append(6)
			@list.append(8)
		end

		it 'removes last element of list' do
			@list.pop
			expect(@list.size).to eql(3)
		end

		it 'returns last element of list' do
			expect(@list.pop.value).to eql(8)
		end

		it 'does it twice' do
			@list.pop
			expect(@list.pop.value).to eql(6)
		end
	end

	describe '#contains?' do
		before do
			@list.append(2)
			@list.append(4)
			@list.append(6)
			@list.append(8)
		end

		it 'finds value at head' do
			expect(@list.contains?(2)).to eql(true)
		end

		it 'finds value' do
			expect(@list.contains?(6)).to eql(true)
		end

		it 'returns false if value not found' do
			expect(@list.contains?(3)).to eql(false)
		end
	end
	
	describe '#find' do
		before do
			@list.append(2)
			@list.append(4)
			@list.append(6)
			@list.append(8)
		end
	
		it 'returns index if value in list' do
			expect(@list.find(6)).to eql(2)
			expect(@list.find(2)).to eql(0)
		end
		
		it 'returns nil if value not in list' do
			expect(@list.find(7)).to eql(nil)
		end
	end
	
	describe '#to_s' do
		it 'prints zero nodes' do
			expect(@list.to_s).to eql('nil')
		end
		
		it 'prints one node' do
			@list.append(2)
			expect(@list.to_s).to eql("( 2 ) -> nil")
		end
		
		it 'prints multiple nodes' do
			@list.append(2)
			@list.append(4)
			@list.append(6)
			@list.append(8)
			expect(@list.to_s).to eql('( 2 ) -> ( 4 ) -> ( 6 ) -> ( 8 ) -> nil')
		end
	end
end
