require_relative 'node'

# Implementation of Linked List using node objects
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new
      @head.value = value
    else
      last_node = tail
      last_node.next_node = Node.new
      last_node.next_node.value = value
    end
  end

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def prepend(value)
    previous_head = @head
    @head = Node.new
    @head.value = value
    @head.next_node = previous_head
  end

  def size
    result = 1
    current_node = @head
    until current_node.next_node.nil?
      result += 1
      current_node = current_node.next_node
    end
    result
  end

  def at(index)
    i = 0
    current_node = @head
    until i == index
      i += 1
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    current_node = @head
    previous_node = current_node
    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
    current_node
  end
end

test = LinkedList.new
test.append(1)
test.append(2)
test.append(3)
p test.size
p test.pop
p test.size
