import 'dart:io';

void main() {
  print("Notenerkennung: Gib die Tonhöhe als Frequenz (z. B. 440.0) ein:");
  String input = stdin.readLineSync() ?? "0.0";
  double frequenz = double.parse(input);

  String note = "Unbekannt";

  // Einfache Frequenzbereiche für Noten (Oktav-unabhängig und grob)
  if (frequenz <= 0) {
    print("Ungültige Frequenz.");
    return;
  }

  // switch-case Beispiel
  switch (true) {
    case true when (frequenz >= 261.0 && frequenz <= 263.0):
      note = "C";
      break;
    case true when (frequenz >= 293.0 && frequenz <= 295.0):
      note = "D";
      break;
    case true when (frequenz >= 329.0 && frequenz <= 331.0):
      note = "E";
      break;
    case true when (frequenz >= 349.0 && frequenz <= 351.0):
      note = "F";
      break;
    case true when (frequenz >= 391.0 && frequenz <= 393.0):
      note = "G";
      break;
    case true when (frequenz >= 440.0 && frequenz <= 442.0):
      note = "A";
      break;
    case true when (frequenz >= 493.0 && frequenz <= 495.0):
      note = "H";
      break;
    default:
      note = "Nicht erkannt";
  }

  var erkannteNote = note;
  bool istTreffer = note != "Nicht erkannt";
  int laenge = note.length;
  laenge++;

  print("\nErgebnis:");
  print("Frequenz: \$frequenz Hz => Note: \$erkannteNote");
  print("Treffer: \$istTreffer");
  print("Notenlänge +1: \$laenge");

  // Beispiel für ??
  String? kommentar;
  String hinweis = kommentar ?? "Keine weiteren Hinweise.";
  print("Hinweis: \$hinweis");
}
