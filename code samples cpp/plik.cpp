#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

void generateRandomNumbers(const string& pathData, const string& pathResult) {
    srand(time(0)); // seed the random number generator
    int a, sum, iteration = rand() % 1000 + 1; // generate a random number of iterations
    string textLine;
    ofstream fileData(pathData); // open file to write random numbers
    for(int i = 0; i < iteration; i++){
        a = rand() % 999998 + 1; // generate a random number to write
        fileData << a << endl;
    }
    fileData.close(); // close file after writing
    ifstream fileDataRead(pathData); // open file to read the generated numbers
    ofstream fileResult(pathResult); // open file to write the sums of digits of the generated numbers
    while (getline(fileDataRead, textLine)){
        sum = 0;
        for(int i = 0; i < textLine.length(); i++){
            sum += textLine[i] - '0'; // convert character to integer value and add to sum
        }
        fileResult << sum << endl; // write the sum of digits to file
    }
    fileDataRead.close(); // close input file after reading
    fileResult.close(); // close output file after writing
}

void printRepeatedCharacter(const string& str) {
    int number;
    string numberStr = "", chr = "", chars = "", confText;
    ifstream fileConf(str); // open configuration file to read the character and repetition number
    while(getline(fileConf, confText)){
        size_t foundChars = confText.find("=");
        if(foundChars != string::npos) {
            for(int i = foundChars+1; i < confText.length(); i++) {
                chars += confText[i];
            }
            chars += " ";
        }
    }
    size_t foundN = chars.find(" ");
    if(foundN != string::npos) {
        for(int i = 0; i < chars.length(); i++) {
            if (i < foundN) {
                chr += chars[i];
            }
            if (i > foundN) {
                numberStr += chars[i];
            }
        }
        number = stoi(numberStr); // convert repetition number from string to integer
    }
    for(int i = 0; i < number; i++) {
        cout << chr;
    }
    fileConf.close(); // close configuration file after reading
}

int main() {
    generateRandomNumbers("C:\Users\skalk\CLionProjects\22\da.txt","C:\Users\skalk\CLionProjects\22\niet.txt");
    printRepeatedCharacter("C:\Users\skalk\CLionProjects\22\dane1.1.txt");
    return 0;
}