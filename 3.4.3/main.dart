void main() {
  // Liste hat garantiert immer 3 Elemente
  List<Map<String, double?>> weatherData = [
    {' temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null},
  ];
  // Erstelle leere Liste für Temperaturen

  double tempSum = 0;
  int anzahl = 0;

  if (weatherData[0]["temp"] != null) {
    tempSum += weatherData[0]["temp"]!;
    anzahl++;
  }
  if (weatherData[1]["temp"] != null) {
    tempSum += weatherData[1]["temp"]!;
    anzahl++;
  }
  if (weatherData[2]["temp"] != null) {
    tempSum += weatherData[2]["temp"]!;
    anzahl++;
  }
  double? avgTemp = tempSum / anzahl;

  // Erstelle leere Liste für Regenmengen
  double rainSum = 0;
  anzahl = 0;
  if (weatherData[0]["rain"] != null) {
    rainSum += weatherData[0]["rain"]!;
    anzahl++;
  }
  if (weatherData[1]["rain"] != null) {
    rainSum += weatherData[1]["rain"]!;
    anzahl++;
  }
  if (weatherData[2]["rain"] != null) {
    rainSum += weatherData[2]["rain"]!;
    anzahl++;
  }

  double? avgRain = rainSum / anzahl;

  // Erstelle leere Liste für Windgeschwindigkeiten
  double windSum = 0;
  anzahl = 0;
  if (weatherData[0]["wind"] != null) {
    windSum += weatherData[0]["wind"]!;
    anzahl++;
  }
  if (weatherData[1]["wind"] != null) {
    windSum += weatherData[1]["wind"]!;
    anzahl++;
  }
  if (weatherData[2]["wind"] != null) {
    windSum += weatherData[2]["wind"]!;
    anzahl++;
  }
  double? avgWind = windSum / anzahl;

  print("Durchschnittstemperatur: $avgTemp");

  print("Durchschnittliche Regenmenge: $avgRain");

  print("Durchschnittliche Windgeschwindigkeit: $avgWind");

  {
    print("Alle null");
  }
}

  //print(temps[0] + temps[1] + temps[2]); // Ausgabe der Summe der Temperaturen


