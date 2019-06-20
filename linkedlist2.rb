class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, previous=nil)
	temp_node = nil
	temp_first = nil
	if list.next_node
		temp_node = LinkedListNode.new(list.value, list.next_node)
		list = LinkedListNode.new(list.value, previous)
		temp_first = reverse_list(temp_node.next_node, list)
	else
		list = LinkedListNode.new(list.value, previous)
		return list
	end
	return temp_first
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
# node1.next_node = node3

print_values(node3)
reversed1 = reverse_list(node3)
print_values(reversed1)
