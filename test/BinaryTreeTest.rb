require "../src/BinaryTree"
require "../src/BinaryTreeNode"
require "test/unit"

class BinaryTreeTest < Test::Unit::TestCase

	def test_should_be_empty_by_default
		tree = BinaryTree.new
		assert tree.empty?
	end

	def test_add_when_tree_is_empty
		tree = BinaryTree.new
    tree.add 'dog'

    assert_equal 1, tree.size
    assert_equal 'dog', tree.root.value
	end

	def test_add_to_the_left_when_tree_has_only_root
		tree = BinaryTree.new
    tree.add 'a'
    tree.add 'b', :left

    assert_equal 2, tree.size
    assert_equal 'a', tree.root.value
    assert_equal 'b', tree.root.left_child.value
    assert tree.root.right_child.nil?
    assert tree.root.left_child.leaf?
	end

 	def test_add_to_the_right_when_tree_has_only_root
		tree = BinaryTree.new
    tree.add 'a'
    tree.add 'c', :right

    assert_equal 2, tree.size
    assert_equal 'a', tree.root.value
    assert_equal 'c', tree.root.right_child.value
    assert tree.root.left_child.nil?
    assert tree.root.right_child.leaf?
	end

  def test_reset_current_node
    tree = create_abc_tree

    assert_equal 3, tree.size
    assert_equal 'a', tree.root.value
    assert_equal 'b', tree.root.left_child.value
    assert_equal 'c', tree.root.right_child.value
    assert tree.root.left_child.leaf?
    assert tree.root.right_child.leaf?    
  end

  def create_abc_tree
    tree = BinaryTree.new
    tree.add 'a'
    tree.add 'c', :right
      
    tree.reset_current_node
    tree.add 'b', :left

    tree
  end
end
