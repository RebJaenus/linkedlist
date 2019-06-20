class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  cycle = detect_cycle(list_node)
  if !cycle
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
  end
end

def reverse_list(list, previous=nil)
  cycle = detect_cycle(list)
  if !cycle
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
  else
    return list
  end
end

def detect_cycle(list_node)
  loop = false
  @node = list_node
  def race(t, h)
    arr = Array.new(2)
    if t == nil || h == nil || h.next_node == nil
      return false
    elsif t == h
      arr[0] = find_mu(t, @node)
      arr[1] = find_lambda(t, h.next_node)
      return arr
    else
      return race(t.next_node, h.next_node.next_node)
    end
  end
  
  def find_mu(t, h)
    count = 0
    if t == h
      return 0
    else
      count = 1 + find_mu(t.next_node, h.next_node)
    end
    return count + 1
  end
    
  def find_lambda(t, h)
    count = 0
    if t == h
      return 1
    else
      count = 1 + find_lambda(t, h.next_node)
    end
    return count
  end
  
  if list_node == nil || list_node.next_node == nil || list_node.next_node.next_node == nil
    loop = false
  else
    loop = race(list_node.next_node, list_node.next_node.next_node)
  end
  if loop
    puts "the linked list has a loop starting at node #{loop[0]} and lasting for #{loop[1]} nodes"
    return true
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
# node1.next_node = node3

print_values(node3)
reversed1 = reverse_list(node3)
print_values(reversed1)

node1 = LinkedListNode.new(1)
node2 = LinkedListNode.new(2, node1)
node3 = LinkedListNode.new(3, node2)
node4 = LinkedListNode.new(4, node3)
node5 = LinkedListNode.new(5, node4)
node2.next_node = node4

print_values(node5)
reversed1 = reverse_list(node5)
print_values(node5)
