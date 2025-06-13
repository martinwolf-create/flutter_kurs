void main() {
  String name =
      "Lennard packt seinen Koffer, für seine Weltreise und lässt hinter sich: ";
  List<int> list = [1, 2, 3, 4, 5, 6, 7];
  List<String> lands = [
    "Deutschland",
    "Frankreich",
    "Spanien",
    "Italien",
    "Griechenland",
    "Portugal",
    "Niederlande",
  ];

  for (String land in lands) {
    print("$name $land");
  }

  print(
    "\nLennard hat seinen Koffer gepackt und ist bereit für die Weltreise!",
  );
  print("Die Länder, die er besucht hat, sind: ${lands.join(', ')}");
  print("Die Anzahl der Länder, die er besucht hat: ${lands.length}");
}
