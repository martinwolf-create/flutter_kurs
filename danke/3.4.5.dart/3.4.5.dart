import 'dart:vmservice_io';

void main() {
  List<int> points = [4, 5, 4, 2, 6, 6, 3];
  List<String> names = [
    'Julietta',
    'Benjamino',
    'Hans-Günther',
    'Evalinea',
    'Fiona',
    'Gregory',
    'Leonhart',
  ];

  print("Aufgabe 1: \n");
  for (String n in names) {
    print('$n');
  }

  print("\nAufgabe 2: \n");

  List<int> sortedPoints = List.from(points);
  sortedPoints.sort((a, b) => a.compareTo(b));

  double average = sortedPoints.length > 0
      ? sortedPoints.reduce((a, b) => a + b) / sortedPoints.length
      : 0;

  print("Durchschnitt: $average");
  print("Maximalwert: ${sortedPoints.last}");
  print("Minimalwert: ${sortedPoints.first}");

  print("\ndanke liebe App Akkedemie");
}
