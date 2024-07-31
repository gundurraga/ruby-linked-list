# Node class represents each element in the LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value # The data stored in this node
    @next_node = next_node # Reference to the next node in the list
  end
end

# LinkedList class represents the full list
class LinkedList
  attr_reader :head # Allow read-only access to the head of the list

  def initialize
    @head = nil # Initialize an empty list
  end

  # Add a new node with the given value to the end of the list
  def append(value)
    if @head.nil?
      @head = Node.new(value) # If the list is empty, create a new head
    else
      current = @head
      # Traverse to the last node
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value) # Add new node at the end
    end
  end

  # Add a new node with the given value to the start of the list
  def prepend(value)
    @head = Node.new(value, @head) # Create new head, pointing to old head
  end

  # Return the total number of nodes in the list
  def size
    return 0 if @head.nil? # Return 0 if the list is empty

    count = 1
    current = @head
    # Count nodes until we reach the end
    until current.next_node.nil?
      current = current.next_node
      count += 1
    end
    count
  end

  # Return the last node in the list
  def tail
    return nil if @head.nil? # Return nil if the list is empty

    current = @head
    # Traverse to the last node
    current = current.next_node until current.next_node.nil?
    current
  end

  # Return the node at the given index
  def at(index)
    return nil if @head.nil? # Return nil if the list is empty

    current = @head
    index.times do
      return nil if current.nil? # Return nil if index is out of bounds

      current = current.next_node
    end
    current
  end

  # Remove and return the last element from the list
  def pop
    return nil if @head.nil? # Return nil if the list is empty

    if @head.next_node.nil?
      # If there's only one element, remove it and return it
      popped = @head
      @head = nil
      return popped
    end

    current = @head
    # Traverse to the second-to-last node
    current = current.next_node until current.next_node.next_node.nil?
    popped = current.next_node
    current.next_node = nil # Remove the last node
    popped
  end

  # Return true if the passed in value is in the list, otherwise return false
  def contains?(value)
    current = @head
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  # Return the index of the node containing value, or nil if not found
  def find(value)
    current = @head
    index = 0
    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  # Represent the LinkedList as a string
  def to_s
    return 'nil' if @head.nil? # Return 'nil' if the list is empty

    result = ''
    current = @head
    until current.nil?
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result + 'nil'
  end

  # Insert a new node with the provided value at the given index
  def insert_at(value, index)
    return prepend(value) if index == 0 # If index is 0, use prepend method

    previous_node = at(index - 1)
    return nil if previous_node.nil? # Return nil if index is out of bounds

    new_node = Node.new(value)
    new_node.next_node = previous_node.next_node
    previous_node.next_node = new_node
  end

  # Remove the node at the given index
  def remove_at(index)
    return nil if @head.nil? # Return nil if the list is empty
    return pop if index >= size - 1 # Use pop method if it's the last element

    if index == 0
      # If removing the first element, update the head
      removed_node = @head
      @head = @head.next_node
      return removed_node
    end

    previous_node = at(index - 1)
    return nil if previous_node.nil? || previous_node.next_node.nil?

    removed_node = previous_node.next_node
    previous_node.next_node = removed_node.next_node
    removed_node
  end
end
