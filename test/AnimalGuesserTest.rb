require "src/BinaryTree"
require "src/BinaryTreeNode"
require "src/AnimalGuesser"
require "test/unit"

class AnimalGuesserTest < Test::Unit::TestCase

  def test_start_guessing
    guesser = AnimalGuesser.new
    
    assert_equal 'dog', guesser.start_guessing
  end

  def test_guessed_wrong_animal
    guesser = AnimalGuesser.new
    
    String msg = guesser.next_question(:no)

    assert_equal 'You win', msg
  end

  def test_guessed_right_animal
    guesser = AnimalGuesser.new
    
    String msg = guesser.next_question(:yes)

    assert_equal 'I win', msg
  end
end
