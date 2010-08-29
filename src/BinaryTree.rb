class BinaryTree

  attr_reader :size, :root, :current_node

  def initialize
    @root = nil
  end

	def empty?
		@root.nil?
	end

  def reset_current_node
    @current_node = @root
  end

  def go_left
    @current_node = @current_node.left_child
  end

  def go_right
    @current_node = @current_node.right_child
  end

  def go_back_one_level
    if @current_node != @root
      @current_node = @current_node.parent
    end
  end

  def add(value, side = :left)
    if empty?
      @root = BinaryTreeNode.new value
      @size = 1
      @current_node = @root
    else
      new_node = BinaryTreeNode.new value
      new_node.parent = @current_node
      @current_node.set_child new_node, side
      @current_node = new_node
      @size += 1
    end
  end

  def add_as_parent(new_value, side)
    new_node = BinaryTreeNode.new new_value
    new_node.parent = @current_node.parent
    if @current_node.root?
      @root = new_node
    else
      side = @current_node == @current_node.parent.left_child ? :left : :right
      @current_node.parent.set_child new_node, side
    end

    @current_node.parent = new_node
    new_node.set_child @current_node, side
    @current_node = new_node
    @size += 1
  end
end
