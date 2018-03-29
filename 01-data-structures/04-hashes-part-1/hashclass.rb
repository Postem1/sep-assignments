class HashClass

  def initialize(size_of)
    @items = Array.new(size_of)
  end

  # Adding a new object to the hash given a key and a value
  def []=(key, value)
    if @items[index(key, size)] == nil
      @items[index(key, size)] = HashItem.new(key, value)
    elsif @items[index(key, size)].key != key
      resize
      self[key] = value
    elsif (@items[index(key, size)].key == key) &&
          (@items[index(key, size)].value != value)
      resize
      @items[index(key, size)] = HashItem.new(key, value)
    end
  end

  # Return the value when a key is given
  def [](key)
    if (@items[index(key, size)] != nil) &&
        @items[index(key, size)].key == key
      @items[index(key, size)].value
    end
  end

  # Doubles the size of an array due to collision
  # reset locations for all elements
  def resize
    old_array  = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |h_item|
      if h_item != nil
        @items[index(h_item.key, size)] = HashItem.new(h_item.key, h_item.value)
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
end
