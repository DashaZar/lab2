#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <set>
#include <sstream>
#include <map>

using namespace std;

map<char, string> morseMap = {
    {'a', ".-"},
    {'b', "-..."},
    {'c', "-.-."},
    {'d', "-.."},
    {'e', "."},
    {'f', "..-."},
    {'g', "--."},
    {'h', "...."},
    {'i', ".."},
    {'j', ".---"},
    {'k', "-.-"},
    {'l', ".-.."},
    {'m', "--"},
    {'n', "-."},
    {'o', "---"},
    {'p', ".--."},
    {'r', ".-."},
    {'s', "..."},
    {'t', "-"},
    {'u', "..-"},
    {'v', "...-"},
    {'w', ".--"},
    {'x', "-..-"},
    {'y', "-.--"},
    {'z', "--.."}
};

string morseCode(char c) {
    auto it = morseMap.find(c);
    return it != morseMap.end() ? it->second : "";
}

int main() {
    string input;
    getline(cin, input);

    stringstream ss(input);
    string word;
    vector<string> words;
    while (ss >> word) {
        words.push_back(word);
    }

    set<string> uniqueMorse;

    for (const string& word : words) {
        string morse = "";
        for (char c : word) {
            morse += morseCode(c);
        }
        sort(morse.begin(), morse.end());
        uniqueMorse.insert(morse);
    }

    cout << uniqueMorse.size() << endl;

    return 0;
}

