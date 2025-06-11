void main() {
  // Liste hat garantiert immer 3 Elemente
  List<Map<String, double?>> weatherData = [
    {' temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null},
  ];
  // Erstelle leere Liste für Temperaturen
  List<double?> temps = [];
  temps.add(weatherData[0]['temp'] ?? 0);
  temps.add(weatherData[1]['temp'] ?? 0);
  temps.add(weatherData[2]['temp'] ?? 0);

  // Füge die Temperaturen der Wetterdaten in die Liste ein temps.add(weatherData[0][ 'temp']); temps.add(weatherData[1]['temp']); temps.add(weatherData[2]['temp']);
  // Berechne den Durchschnitt der Temperaturen
  double? avgTemp = (temps[0]! + temps[1]! + temps[2]!) / 3;
  print('Durchschnittstemperatur: $avgTemp');
  // Erstelle leere Liste für Niederschläge
  List<double?> rains = [];
  rains.add(weatherData[0]['rain'] ?? 0);
  rains.add(weatherData[1]['rain'] ?? 0);
  rains.add(weatherData[2]['rain'] ?? 0);
  // Berechne den Durchschnitt der Niederschläge
  double? avgRain = (rains[0]! + rains[1]! + rains[2]!) / 3;
  print('Durchschnittlicher Niederschlag: $avgRain');
  // Erstelle leere Liste für Windgeschwindigkeiten
  List<double?> winds = [];
  winds.add(weatherData[0]['wind'] ?? 0);
  winds.add(weatherData[1]['wind'] ?? 0);
  winds.add(weatherData[2]['wind'] ?? 0);
  // Berechne den Durchschnitt der Windgeschwindigkeiten
  double? avgWind = (winds[0]! + winds[1]! + winds[2]!) / 3;
  print('Durchschnittliche Windgeschwindigkeit: $avgWind');

  print('Wetterdaten: $weatherData');
  print('Temperaturen: $temps');
  print('Niederschläge: $rains');
  print('Windgeschwindigkeiten: $winds');
}
