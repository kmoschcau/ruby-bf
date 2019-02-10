# frozen_string_literal: true

require 'io/console'

# A brainfuck interpreter.
class BfInterpreter
  # Map of known commands, mapping to their code lambdas
  COMMANDS = {
    '>' => -> { @registers[@pointer += 1] ||= 0 },
    '<' => -> { @pointer = 0 if (@pointer -= 1).negative? },
    '+' => -> { @registers[@pointer] += 1 },
    '-' => -> { @registers[@pointer] -= 1 },
    '.' => -> { print @registers[@pointer].chr },
    ',' => -> { @registers[@pointer] = STDIN.getch.ord || 0 },
    '[' => -> { @loop_marker = @code_index },
    ']' => -> { @code_index = @loop_marker if @registers[@pointer].positive? }
  }.freeze

  def initialize
    reset
  end

  def reset
    @registers   = [0]
    @pointer     = 0
    @loop_marker = 0
    @code_index  = 0
  end

  def run(code)
    @code_index = 0
    while @code_index < code.size
      instance_exec(&COMMANDS[code[@code_index]])
      @code_index += 1
    end
  end
end
