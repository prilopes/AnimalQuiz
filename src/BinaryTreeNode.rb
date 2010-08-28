class BinaryTreeNode

  attr_reader :value, :left_child, :right_child
  attr_writer :left_child, :right_child

	def initialize(value)
		@value = value	
	end

	def leaf?
		@left_child.nil? && @right_child.nil?
	end

	def root?
		@parent.nil?
	end
end
