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
      if side == :left
        @current_node.left_child = new_node
      else
        @current_node.right_child = new_node
      end
      @current_node = new_node
      @size += 1
    end
  end
end
