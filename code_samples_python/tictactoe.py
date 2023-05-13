import random


def draw_board(board):
    print(board[0]+"|"+board[1]+"|"+board[2])
    print("________"+"|"+"________"+"|"+"________")
    print(board[3] + "|" + board[4] + "|" + board[5])
    print("________" + "|" + "________" + "|" + "________")
    print(board[6] + "|" + board[7] + "|" + board[8])
    print("________" + "|" + "________" + "|" + "________")


def kto_ma_tury(board):
    while True:
        move = int(input("Enter your move (1-9): "))
        if move < 1 or move > 9:
            print("Invalid move. Please enter a number between 1 and 9.")
        elif board[move - 1] != " ":
            print("That space is already taken. Please choose a different space.")
        else:
            return move - 1


def ruch_kompa(board):
    empty_spaces = [i for i in range(9) if board[i] == " "]
    if len(empty_spaces) == 0:
        return None
    else:
        return random.choice(empty_spaces)


def check_win(board):
    for i in range(0, 9, 3):
        if board[i] == board[i + 1] == board[i + 2] != " ":
            return board[i]
    for i in range(3):
        if board[i] == board[i + 3] == board[i + 6] != " ":
            return board[i]
    if board[0] == board[4] == board[8] != " ":
        return board[0]
    if board[2] == board[4] == board[6] != " ":
        return board[2]
    if " " not in board:
        return "tie"
    return None


def play_game():
    board = [" " for i in range(9)]
    draw_board(board)
    while True:
        player_move = ruch_kompa(board)
        board[player_move] = "X"
        draw_board(board)
        winner = check_win(board)
        if winner is not None:
            break
        print("tura komputera")
        computer_move = ruch_kompa(board)
        if computer_move is None:
            break
        board[computer_move] = "O"
        draw_board(board)
        winner = check_win(board)
        if winner is not None:
            break
    if winner == "X":
        print("Wygrales!")
    elif winner == "O":
        print("komputer wygrał.")
    else:
        print("Remis.")
