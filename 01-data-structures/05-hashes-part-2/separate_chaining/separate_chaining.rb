require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :item_count

  def initialize(size_of)
    @max_load_factor = 0.7
    @items = Array.new(size_of)
    @item_count = 0.0
  end

  # Adding a new object to the hash given a key and a value
  def []=(key, value)
    if @items[index(key, size)] == nil
      @items[index(key, size)] = LinkedList.new
    end

    @items[index(key, size)].add_to_tail(Node.new(key, value))
    @item_count += 1

    if load_factor >= @max_load_factor
      resize
    end
  end

  # Return the value when a key is given
  def [](key)
    if @items[index(key,size)] != nil
      current = @items[index(key, size)].head #chooses head node
      while current != nil
        if current.key == key
          return current.value
        else
          current = current.next
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |list|
      if list != nil
        current_node = list.head
        while current_node != nil
          if @items[index(current_node.key, size)] == nil
            @items[index(current_node.key, size)] = LinkedList.new
            @items[index(current_node.key, size)].add_to_front(Node.new(current_node.key, current_node.value))
            if load_factor >= @max_load_factor
              resize
            end
          else
            @items[index(current_node.key, size)].add_to_tail(Node.new(current_node.key, current_node.value))
            if load_factor >= @max_load_factor
              resize
            end
          end
          current_node = current_node.next
        end
      end
    end
  end

  def print_hash
    puts "The Hash's Load factor is: #{load_factor}, the number of items in the hash is: #{item_count}"
    @items.each do |list|
      if list != nil
        current_node = list.head
        while current_node != nil
          puts "Key: #{current_node.key}, Value: #{current_node.value}"
          current_node = current_node.next
        end
      end
    end
  end
end

star_wars_movies = SeparateChaining.new(6)
star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

star_wars_movies.print_hash
