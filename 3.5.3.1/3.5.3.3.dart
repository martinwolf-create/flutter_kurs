int max_vorwels(String text) {
  int count = 0;

  List<String> vorwels = ["A", "E", "I", "O", "U"];

  for (int i = 0; i < text.length; i++) {
    for (String s in vorwels) {
      if (text[i].toUpperCase() == s) {
        count++;
      }
    }
  }

  return count;
}

void main() {
  print(max_vorwels("Martin_Wolf")); // Ausgabe:3
  print(max_vorwels("App_Akademie")); // Ausgabe:6
  print(max_vorwels("Aaaa")); // Ausgabe: 4
}
