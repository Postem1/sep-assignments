require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    current = @head

    if (@head == nil) && (@tail == nil)
      @head = node
      @tail = node
    #add eslif for tail
    else
      while current.next != nil
        current = current.next
      end
      current.next = node
      @tail = node
      @tail.next = nil
    end
  end

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

    puts current.value

    while current.next != nil
      current = current.next
      puts current.value
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head

    if @head == node
      remove_front
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
