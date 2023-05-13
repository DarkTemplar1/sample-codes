#include <iostream>
#include <string>
#include <vector>
#include <algorithm>


using namespace std;


struct Event {
    string nazwa_eventu;
    string data_eventu;
    string czas_rozpoczecia_eventu;
    string miejsca_eventu;
};

vector<Event> events;

void addEvent() {
    Event event;
    cout << "imie: ";
    getline(cin, event.nazwa_eventu);
    cout << "Data eventu: ";
    getline(cin, event.data_eventu);
    cout << "Czas eventu: ";
    getline(cin, event.czas_rozpoczecia_eventu);
    cout << "umiejscowienie: ";
    getline(cin, event.miejsca_eventu);
    events.push_back(event);
    cout << "dodales event" << endl;
}


void editEvent() {
    if (events.empty()) {
        cout << "Nie ma co edytować ." << endl;
        return;
    }
    cout << "Podaj jego nazwe: ";
    string eventnazwa_eventu;
    getline(cin, eventnazwa_eventu);
    auto it = find_if(events.begin(), events.end(), [&](const Event& e) {
        return e.nazwa_eventu == eventnazwa_eventu;
    });
    if (it == events.end()) {
        cout << "nie znaleziono wydarzenia." << endl;
        return;
    }
    cout << "nowa zmiana(enter na zostawienie starej nazwy): ";
    string newnazwa_eventu;
    getline(cin, newnazwa_eventu);
    if (!newnazwa_eventu.empty()) {
        it->nazwa_eventu = newnazwa_eventu;
    }
    cout << "Nowa data(enter na zostawienie starej nazwy): ";
    string newdata_eventu;
    getline(cin, newdata_eventu);
    if (!newdata_eventu.empty()) {
        it->data_eventu = newdata_eventu;
    }
    cout << "Nowa godzina rozpoczęcia(enter na zostawienie starej nazwy): ";
    string newczas_rozpoczecia_eventu;
    getline(cin, newczas_rozpoczecia_eventu);
    if (!newczas_rozpoczecia_eventu.empty()) {
        it->czas_rozpoczecia_eventu = newczas_rozpoczecia_eventu;
    }
    cout << "nowe miejsce rozpoczęcia(enter na zostawienie starej nazwy): ";
    string newmiejsca_eventu;
    getline(cin, newmiejsca_eventu);
    if (!newmiejsca_eventu.empty()) {
        it->miejsca_eventu = newmiejsca_eventu;
    }
    cout << "Event edited successfully!" << endl;
}


void removeEvent() {
    if (events.empty()) {
        cout << "Nie ma do eventu do usuniecia" << endl;
        return;
    }
    cout << "Podaj nazwe eventu do usunięcia: ";
    string eventnazwa_eventu;
    getline(cin, eventnazwa_eventu);
    auto it = find_if(events.begin(), events.end(), [&](const Event& e) {
        return e.nazwa_eventu == eventnazwa_eventu;
    });
    if (it == events.end()) {
        cout << "event nie znalezione." << endl;
        return;
    }
    events.erase(it);
    cout << "event usuniety" << endl;
}


void displayEvents() {
    if (events.empty()) {
        cout << "nie ma eventów do pokazania" << endl;
        return;
    }
    for (const auto& e : events) {
        cout << e.nazwa_eventu << endl << e.data_eventu << endl << e.czas_rozpoczecia_eventu << endl << e.miejsca_eventu << endl;
    }
}


int main() {
    while (true) {
        cout << endl;
        cout << "wybierz opcje" << endl;
        cout << "1. dodaj event" << endl;
        cout << "2. Edytuj event" << endl;
        cout << "3. Usun event z listy" << endl;
        cout << "4. Pokaż eventy " << endl;
        cout << "5. zakończ" << endl;
        int wybor;
        cin >> wybor;
        cin.ignore();
        switch (wybor) {
            case 1:
                addEvent();
                break;
            case 2:
                editEvent();
                break;
            case 3:
                removeEvent();
                break;
            case 4:
                displayEvents();
                break;
            case 5:
                cout << "narazie!" << endl;
                return 0;
            default:
                cout << "wybierz prawidlowe opcje" << endl;
                break;
        }
    }
}
