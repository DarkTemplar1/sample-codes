#include <iostream>
#include <random>
using namespace std;

char board[3][3] = { {' ', ' ', ' '}, {' ', ' ', ' '}, {' ', ' ', ' '} };

void draw_board()
{
    cout << "  1 2 3\n";
    for (int i = 0; i < 3; i++)
    {
        cout << i+1 << " ";
        for (int j = 0; j < 3; j++)
        {
            cout << board[i][j];
            if (j != 2) cout << "|";
        }
        if (i != 2) cout << "\n  -----\n";
    }
    cout << "\n";
}

bool check_win(char mark)
{
    for (int i = 0; i < 3; i++)
    {
        if (board[i][0] == mark && board[i][1] == mark && board[i][2] == mark) return true;
        if (board[0][i] == mark && board[1][i] == mark && board[2][i] == mark) return true;
    }
    if (board[0][0] == mark && board[1][1] == mark && board[2][2] == mark) return true;
    if (board[0][2] == mark && board[1][1] == mark && board[2][0] == mark) return true;
    return false;
}

bool check_tie()
{
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if (board[i][j] == ' ') return false;
        }
    }
    return true;
}

void player_move(char mark)
{
    int row, col;
    cout << "Enter row and column (e.g. 1 2): ";
    cin >> row >> col;

    if (row < 1 || row > 3 || col < 1 || col > 3)
    {
        cout << "Invalid row or column. Try again.\n";
        player_move(mark);
    }

    if (board[row-1][col-1] != ' ')
    {
        cout << "This cell is already taken. Try again.\n";
        player_move(mark);
    }

    board[row-1][col-1] = mark;
}

void computer_move(char mark)
{
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(1, 3);
    int row = dis(gen);
    int col = dis(gen);

    while (board[row-1][col-1] != ' ')
    {
        row = dis(gen);
        col = dis(gen);
    }

    board[row-1][col-1] = mark;
}

int main()
{
    draw_board();

    while (true)
    {
        // Player's turn
        player_move('X');
        draw_board();
        if (check_win('X'))
        {
            cout << "You win!\n";
            break;
        }
        if (check_tie())
        {
            cout << "It's a tie!\n";
            break;
        }

        // Computer's turn
        cout << "The computer is making a move...\n\n";
        computer_move('O');
        draw_board();
        if (check_win('O'))
        {
            cout << "The computer wins!\n";
            break;
        }
        if (check_tie())
        {
            cout << "It's a tie!\n";
            break;
        }
    }

    return 0;
}


