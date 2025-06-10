void main() {
  
//reiseroute mit distanz
Map<String, int> reiseroute = {"Max": 120, "Moritz": 150, "Hans": 200};

//Geschwindigkeit in km/h
double geschwindigkeitMax = 60.0; // Max fährt 60 km/h
double geschwindigkeitMoritz = 80.0; // Moritz fährt 80 km/h
double geschwindigkeitHans = 100.0; // Hans fährt 100 km/h

//fahrzeugdistanzberechnung
double distanzMax = reiseroute["Max"]! / geschwindigkeitMax;
double distanzMoritz = reiseroute["Moritz"]! / geschwindigkeitMoritz;
double distanzHans = reiseroute["Hans"]! / geschwindigkeitHans;

//fahrzeuggeschwindigkeitsberechnung
double geschwindigkeitMaxBerechnet = reiseroute["Max"]! / distanzMax;
double geschwindigkeitMoritzBerechnet = reiseroute["Moritz"]! / distanzMoritz;
double geschwindigkeitHansBerechnet = reiseroute["Hans"]! / distanzHans;

//Gesamtdistanz und Fahrtzeitberechnung
double gesamtKm = reiseroute["Max"]! + reiseroute["Moritz"]! + reiseroute["Hans"]!;
double gesamtZeit = (distanzMax + distanzMoritz + distanzHans) / 3.0;}











//fahrzeugzeizberechnung
double zeitMax = reiseroute["Max"]! / 60.0;
double zeitMoritz = reiseroute["Moritz"]! / 60.0;
double zeitHans = reiseroute["Hans"]! / 60.0;




}