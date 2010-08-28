class AnimalGuesser

  def initialize
    @question_tree = BinaryTree.new
    @question_tree.add 'dog'
  end

  def start_guessing
    @question_tree.reset_current_node
    @question_tree.current_node.value
  end

  def next_question(answer)
    if @question_tree.current_node.leaf?    
      if answer == :yes
        'I win'
      else
        'You win'
      end
    end
  end
end
