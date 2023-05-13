#include <iostream>
#include <string>
#include <utility>
#include <vector>


using namespace std;


class Flight {
public:
    string numer_lotu;
    string Miasto_startowe;
    string Miasto_docelowe;
    int distance;
    int altitude;
    int predkosc_lotu;


    Flight(string number, string departure, string destination, int dist, int alt, int sp) :
            numer_lotu(std::move(number)), Miasto_startowe(std::move(departure)), Miasto_docelowe(std::move(destination)), distance(dist), altitude(alt), predkosc_lotu(sp) {}
};


class samolot {
public:
    string airplaneModel;
    int capacity;
    int fuelCapacity;
    int currentFuelLevel;
    int currentAltitude;
    int currentSpeed;
    vector<Flight> flights;


    samolot(string model, int cap, int fuelCap, int currentAlt, int currentSp) :
            airplaneModel(std::move(model)), capacity(cap), fuelCapacity(fuelCap), currentFuelLevel(fuelCap), currentAltitude(currentAlt), currentSpeed(currentSp) {}


    void addFlight(const Flight& flight) {
        flights.push_back(flight);
    }




    void displayFlights() {
        cout << "loty do samolotów  " << airplaneModel << "\n";
        for (auto & flight : flights) {
            cout << flight.numer_lotu << "" - "" << flight.Miasto_docelowe <<  "do " << flight.Miasto_startowe << "\n";
        }
    }


    void fly(Flight flight) {
        cout << "odlot z " << flight.Miasto_docelowe << " do " << flight.Miasto_startowe << "\n";
        while (currentAltitude < flight.altitude) {
            currentAltitude += 1000;
            cout << "Altitude: " << currentAltitude << " feet\n";
        }
        cout << "Predkosc lotu " << flight.predkosc_lotu << " km/h...\n";
        while (currentSpeed < flight.predkosc_lotu) {
            currentSpeed += 50;
            cout << "Predkosc: " << currentSpeed << " km/h\n";
        }
        while (currentFuelLevel > 0) {
            currentFuelLevel -= flight.distance / 10;
            cout << "Poziom paliwa : " << currentFuelLevel << " litry\n";
        }
        cout << "Ladowanie w " << flight.Miasto_docelowe << "\n";
    }
};


int main() {
    samolot airplane("Boeing 737", 189, 24000, 0, 0);
    Flight flight1("AA123", "Dallas", "Chicago", 800, 30000, 500);
    Flight flight2("UA456", "Los Angeles", "New York", 2500, 35000, 550);
    airplane.addFlight(flight1);
    airplane.addFlight(flight2);
    airplane.displayFlights();
    airplane.fly(flight1);
    airplane.fly(flight2);
    return 0;
}

