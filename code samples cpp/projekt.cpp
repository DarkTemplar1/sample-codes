#include <iostream>
using namespace std;

int main() {
    int length, row = 0, col = 0;
    char symbol;

    cout << "Podaj dlugosc: ";
    cin >> length;

    int A[length];
    int B[length];

    for (int i = 0; i < length; i++) {
        A[i] = (i + 1) * 2;
    }

    cout << "Podaj symbol: ";
    cin >> symbol;

    cout << "Podaj wysokosc obrazka: ";
    int height;
    cin >> height;

    cout << "Podaj szerokosc obrazka: ";
    int width;
    cin >> width;

    char A1[height][width];

    for (int i = 0; i < length; i++) {
        if (A[i] < height) {
            B[i] = A[i];
        }
    }

    if (height % 2 == 0) {
        row = height / 2;
    } else {
        row = (height + 1) / 2;
    }

    if (width % 2 == 0) {
        col = width / 2;
    } else {
        col = (width + 1) / 2;
    }

    int A2[col];

    // Dolna linia
    int d = col;
    while (d <= width) {
        A1[row][col] = symbol;
        row++;
        col--;
        d++;
    }

    // Powrot do srodka
    if (height % 2 == 0) {
        row = height / 2;
    } else {
        row = (height + 1) / 2;
    }

    if (width % 2 == 0) {
        col = width / 2;
    } else {
        col = (width + 1) / 2;
    }

    // Gorna linia
    d = col;
    while (d <= width) {
        A1[row][col] = symbol;
        row++;
        col--;
        d++;
    }

    return 0;
}

