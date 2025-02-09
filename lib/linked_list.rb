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
      last_node.value = value
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
    result = 0
    until current_node.next_node.nil?
      result += 1
      current_node = current_node.next_node
    end
    result
  end

  def at(index)
    i = 0
    current_node = @head
    current_node = current_node.next_node until i == index || current_node.next_node.nil?
    current_node
  end
end
