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

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    i = 1
    until current_node.nil?
      return i if current_node.value == value

      i += 1
      current_node = current_node.next_node
    end
  end

  def to_s
    result = ''

    current_node = @head
    until current_node.nil?
      result += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    "#{result} nil"
  end
end

test = LinkedList.new
test.append('l')
test.append('k')
test.append('c')

p test.to_s
