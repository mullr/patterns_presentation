class InsertTextCommand
  def initialize(position, new_text)
    @position = position
    @new_text = new_text
  end

  def apply(text)
    text[0, @position] + @new_text + text[@position, text.length]
  end

  def undo(text)
    text[0, @position] + text[@position + @new_text.length, text.length]
  end
end

class UndoableBuffer
  def initialize(text)
    @text = text
    @undo_stack = []
  end

  def print()
    puts @text
  end

  def change_text(command)
    @text = command.apply(@text)
    @undo_stack.push(command)
  end

  def undo()
    command = @undo_stack.pop()
    @text = command.undo(@text)
  end
end

buffer = UndoableBuffer.new('test'); buffer.print

buffer.change_text InsertTextCommand.new(0, 'This is a '); buffer.print
buffer.change_text InsertTextCommand.new(10, 'really great '); buffer.print

buffer.undo; buffer.print
buffer.undo; buffer.print
