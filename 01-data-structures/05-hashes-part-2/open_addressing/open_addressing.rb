require_relative 'node'

class OpenAddressing
  attr_reader :item_count

  def initialize(size_of)
    @items = Array.new(size_of)
    @item_count = 0.0
  end


 #Assign an element to the "hash array" given a key and value
  def []=(key, value)
    arr_index = index(key, size)
    if @items[arr_index] == nil #no existing object at index
        @items[arr_index] = Node.new(key, value)
        @item_count += 1
    elsif (@items[arr_index].key == key) &&
          (@items[arr_index].value == value)
      return @items
    else #exisitng element at index
      nextIndex = next_open_index(arr_index)
      if (@items[arr_index].key == key) && #element has same key
         (@items[arr_index].value != value) && #element has different value
        (nextIndex == -1) #no space in the array
          resize
          @items[arr_index] = Node.new(key, value)  
          @item_count += 1
      elsif nextIndex == -1 # no additional space
        resize
        self[key] = value
      else # exisitng elemet but there is space in the array
        @items[nextIndex] = Node.new(key, value)
        @item_count += 1
      end
    end
  end

  def [](key)
    arr_index = index(key, size)

    while arr_index < size
      if @items[arr_index].key == key
        return @items[arr_index].value
      else
        arr_index += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index] != nil
     index += 1
    end
    if index >= @items.length
      return -1
    else
      return index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items

    @items = Array.new(old_array.length * 2)
    old_array.each do |hash_item|
      if hash_item != nil
        @items[index(hash_item.key, @items.length)] = Node.new(hash_item.key, hash_item.value)
      end
    end
  end

  def load_factor
    @item_count / size
  end

  def print_hash
    puts "The Open Addressing hash's Load Factor is: #{load_factor}, the number of items in the hash is: #{item_count}"
    @items.each do |hash_item|
      if hash_item != nil
          puts "#{hash_item.key}, Value: #{hash_item.value}"
        end
      end
  end
end

star_wars_movies = OpenAddressing.new(6)
star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

star_wars_movies.print_hash
