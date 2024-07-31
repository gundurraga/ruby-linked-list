require_relative 'linked_list' # Make sure this points to your LinkedList file

def separator
  puts "\n" + '-' * 50 + "\n"
end

# Create a new list
list = LinkedList.new
puts 'Created a new empty list'
separator

# Test append
puts 'Testing append:'
list.append('dog')
list.append('cat')
list.append('parrot')
puts list
separator

# Test prepend
puts 'Testing prepend:'
list.prepend('hamster')
puts list
separator

# Test size
puts 'Testing size:'
puts "Size of the list: #{list.size}"
separator

# Test head
puts 'Testing head:'
puts "Head of the list: #{list.head.value}"
separator

# Test tail
puts 'Testing tail:'
puts "Tail of the list: #{list.tail.value}"
separator

# Test at
puts 'Testing at:'
puts "Node at index 2: #{list.at(2).value}"
separator

# Test pop
puts 'Testing pop:'
popped = list.pop
puts "Popped value: #{popped.value}"
puts "List after pop: #{list}"
separator

# Test contains?
puts 'Testing contains?:'
puts "Contains 'cat'? #{list.contains?('cat')}"
puts "Contains 'turtle'? #{list.contains?('turtle')}"
separator

# Test find
puts 'Testing find:'
puts "Index of 'cat': #{list.find('cat')}"
puts "Index of 'turtle': #{list.find('turtle')}"
separator

# Test insert_at
puts 'Testing insert_at:'
list.insert_at('snake', 2)
puts "After inserting 'snake' at index 2: #{list}"
separator

# Test remove_at
puts 'Testing remove_at:'
removed = list.remove_at(1)
puts "Removed value at index 1: #{removed.value}"
puts "List after removal: #{list}"
separator

# Final list state
puts 'Final list state:'
puts list
