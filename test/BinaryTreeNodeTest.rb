require_relative "../src/BinaryTreeNode"
require "test/unit"

class BinaryTreeNodeTest < Test::Unit::TestCase

	def test_node_is_leaf_when_has_no_children
		node = BinaryTreeNode.new('dog')
		assert node.leaf?
	end

	def test_node_is_root_when_has_no_parent
		node = BinaryTreeNode.new('dog')
		assert node.root?	
	end
end
