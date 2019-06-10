class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  # Push a value onto the stack
  def push(value)
    if ! @data
      @data = LinkedListNode.new(value)
    else
      @data = LinkedListNode.new(value, @data)
    end
  end

  # Pop an item of the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    if @data
      tempval = @data.value
      @data = @data.next_node
      return tempval
    else
      return nil
    end
  end
end

def reverse_list(list)
  tempstack = Stack.new
  first = nil
  while list
    tempstack.push(list.value)
    list = list.next_node
  end
  first = LinkedListNode.new(tempstack.pop, tempstack.data)
  templist = first.next_node
  while tempstack.data != nil
    templist = LinkedListNode.new(tempstack.pop, tempstack.data)
    templist = templist.next_node
  end

  return first
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


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)
