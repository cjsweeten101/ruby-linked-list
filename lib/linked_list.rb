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
      last_node = traverse_to_end
      last_node.next_node = Node.new
      last_node.value = value
    end
  end

  def traverse_to_end
    current_node = @head
    current_node.next_node = current_node until current_node.next_node.nil?
    current_node
  end

  def prepend(value)
    previous_head = @head
    @head = Node.new
    @head.value = value
    @head.next_node = previous_head
  end
end
