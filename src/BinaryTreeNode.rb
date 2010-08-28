class BinaryTreeNode
	
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
