require 'benchmark'
require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if (@head == nil) && (@tail == nil)
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
      @tail.next = nil
    end
  end

  # head -> a_node -> another_node -> one_more_node -> old_tail -> tail -> nil

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head

    if @head == @tail
      @head = nil
      @tail = nil
    else
      while (current.next != nil) && (current.next != @tail)
        current = current.next
      end
      @tail = current
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current = @head

    puts current.data

    while current.next != nil
      current = current.next
      puts current.data
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head

    if @head == node
      @head = @head.next
    elsif @tail == node
      remove_tail
    else
      while current != node
        previous = current
        current = current.next
      end
      previous.next = current.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    current = node
    old_head = @head

    if @head == nil
      @head = current
      @tail = current
    else
      @head = current
      @head.next = old_head
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    old_head = @head
    if (@head == nil) || (@head.next == nil) || (@head == @tail)
      @head = nil
    else
       @head = old_head.next
    end
  end
end

link = LinkedList.new
node = Node.new("candy")
big_arr = Array.new(10000, node)
big_list = 10000.times {link.add_to_tail(node)}

puts "Create a 10,000 item array"
puts Benchmark.measure { Array.new(10000, node) }

puts "Remove the 5,000 item "
puts Benchmark.measure { big_arr.delete_at(5000) }

puts "Add 10,000 items to a Linked List"
puts Benchmark.measure { 10000.times do
   link.add_to_tail(node)
 end
}

puts "Remove the last item in a Linked List"
puts Benchmark.measure {link.remove_tail}
