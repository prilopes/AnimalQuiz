class BinaryTree

  attr_reader :size, :root

	def empty?
		@root.nil?
	end

  def reset_current_node
    @current_node = @root
  end

  def add(value, side = :left)
    if empty?
      @root = BinaryTreeNode.new value
      @size = 1
      @current_node = @root
    else
      new_node = BinaryTreeNode.new value
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
