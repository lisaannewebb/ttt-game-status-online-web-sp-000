# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


def full?(board)
  board.all? {|square| square == "X" || square == "O"}
end
#Checking condition "board" to see if all the square spaces have content. If all full => true. Using implicit return here (and in other blocks)

def won?(board)
  WIN_COMBINATIONS.each do|win|
    if (board[win[0]] == 'X' && board[win[1]] == 'X' && board[win[2]] == 'X') || (board[win[0]] == 'O' && board[win[1]] == 'O' && board[win[2]] == 'O')
      return win
    end
  end
  false
end

#Define a constant so you don't have to keep defining the variable. Ask method to iterate over each space and define a new local variable "win". If the character in space 1 (index 0) equals an X or an O, and has matching characters in indexes 1 and 2, then it's a win. If not, it's not a win. #Don't have to say "return" here either. 


def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end
#If there is a winning combination OR no winner but a full board, the game is over. 

def winner(board)
    who_wins = won?(board)
    if who_wins
      board[who_wins[0]] 
    else
        nil
    end
end
#who_wins evaluates won? and returns a winner; looks at board to see if winner is an X or and O and returns that value. 