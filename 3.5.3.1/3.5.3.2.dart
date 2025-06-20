int zaehle_Zeichen(String text) {
  // Diese Funktion zählt die Anzahl der Zeichen in einem gegebenen Text.
  // Sie gibt die Anzahl der Zeichen als volle zahl zurück.
  return text.length;
}

void main() {
  print(zaehle_Zeichen("Martin_Wolf!")); // Ausgabe: 11
  print(zaehle_Zeichen("App_Academie")); // Ausgabe: 12
  print(zaehle_Zeichen("Dart")); // Ausgabe: 4
}
