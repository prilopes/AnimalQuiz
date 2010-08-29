class BinaryTreeNode

  attr_reader :value, :left_child, :right_child, :parent
  attr_writer :parent

	def initialize(value)
		@value = value	
    @left_child = nil
    @right_child = nil
    @parent = nil
	end

	def leaf?
		@left_child.nil? && @right_child.nil?
	end

	def root?
		@parent.nil?
	end

  def set_child(child, side)
    if side == :left
      @left_child = child
    else
      @right_child = child
    end
  end
end
