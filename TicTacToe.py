board = [[' ',' ',' '],
         [' ',' ',' '],
         [' ',' ',' ']]

def print_board():
  # print the current board
  for row in board:
    print(row)

def player_move(player):
  # ask the player for their next move and make it on the board
  move_x = int(input("X coordinate of your move: "))
  move_y = int(input("Y coordinate of your move: "))
  if move_x >2:
    print("Out of range pick number 0 to 2 for X")
    player_move(player)
  elif move_y >2 :
    print("Out of range pick number 0 to 2 for Y")
    player_move(player)
  elif board[move_x][move_y] != ' ':
    print("That space is already occupied!")
    player_move(player)
  
  else:
    board[move_x][move_y] = player

def game_won(player):
  # check the rows
  for row in board:
    if row == [player, player, player]:
      return True
  # check the columns
  for col in range(3):
    if board[0][col] == player and board[1][col] == player and board[2][col] == player:
      return True
  # check the diagonals
  if board[0][0] == player and board[1][1] == player and board[2][2] == player:
    return True
  if board[0][2] == player and board[1][1] == player and board[2][0] == player:
    return True
  return False

def game_tied():
  # check if the game is tied (no more spaces on the board)
  for row in board:
    if ' ' in row:
      return False
  return True

# main game loop
while True:
  print_board()
  player_move('X')
  if game_won('X'):
    print("X wins!")
    break
  elif game_tied():
    print("It's a tie!")
    break
  print_board()
  player_move('O')
  if game_won('O'):
    print("O wins!")
    break
  elif game_tied():
    print("It's a tie!")
    break
