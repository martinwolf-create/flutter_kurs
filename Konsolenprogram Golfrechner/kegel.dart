import 'dart:io';

void main() {
  print("\nWillkommen beim Kegelspiel-Rechner!\n");
  print("120 wurfe, 4 Bahnen, 15 volle und 15 Abräumer pro Bahn.\n");

  //1. teamnamen eingabe
  stdout.write("Gib den Namen des ersten Teams ein: \n");
  String team1Name = stdin.readLineSync() ?? "Team 1";
  stdout.write("Gib den Namen des zweiten Teams ein: \n");
  String team2Name = stdin.readLineSync() ?? "Team 2";
  print("\nDie Teams sind: $team1Name und $team2Name");

  const int bahnen = 4;
  const int volleWuerfe = 15;
  const int abraeumerWuerfe = 15;

  List<int> gesamtErgebnisse = [];
  String siegerBahn = "";
  int hoechstesErgebnis = 0;

  for (int i = 1; i <= bahnen; i++) {
    print("\n=== Bahn $i ===");

    int summeVolle = 0;
    int summeAbraeumer = 0;

    // Volle
    for (int wurf = 1; wurf <= volleWuerfe; wurf++) {
      stdout.write("Volle Wurf $wurf: ");
      String input = stdin.readLineSync() ?? "";
      int kegel = int.tryParse(input ?? '') ?? 0;
      summeVolle += kegel;
    }
    print("Summe Volle Kegel auf Bahn $i: $summeVolle\n");
    if (summeVolle > 135) {
      print("Achtung: Summe der vollen Kegel max 135!");
    }

    if (summeVolle == 135) {
      print("Perfekt! Alle Kegel voll getroffen.");
    } else if (summeVolle < 135) {
      print("Es fehlen ${135 - summeVolle} Kegel zu den vollen 135.");
    }

    //  Abräumer
    int restKegel = 135 - summeVolle;
    int wurfSumme = 0;
    bool abgeraeumt = false;
    if (restKegel < 0) {
      restKegel = 0; // Sicherstellen, dass der Rest nicht negativ wird
    }
    print("Restkegel für Abräumer: $restKegel");
    stdout.write("Abräumer Wurf 1: ");
    for (int wurf = 1; wurf <= abraeumerWuerfe; wurf++) {
      if (restKegel <= 0) {
        print("Keine Kegel mehr zum Abräumen übrig.");
        break;
      }
      stdout.write("Abräumer Wurf $wurf: ");
      String input = stdin.readLineSync() ?? "0";
      int kegel = int.parse(input);
      wurfSumme += kegel;
      restKegel -= kegel;
      if (restKegel < 0) {
        restKegel = 0; // Sicherstellen, dass der Rest nicht negativ wird
      }

      while (!abgeraeumt) {
        stdout.write("Abräumer (Rest $restKegel): ");
        String input = stdin.readLineSync() ?? "0";
        int kegel = int.parse(input);
        wurfSumme += kegel;
        restKegel -= kegel;

        if (restKegel <= 0) {
          abgeraeumt = true;
        }
      }
      summeAbraeumer += wurfSumme;
    }

    int bahnGesamt = summeVolle + summeAbraeumer;
    gesamtErgebnisse.add(bahnGesamt);

    print(
      "Ergebnis Bahn $i: Volle = $summeVolle, Abräumer = $summeAbraeumer, Gesamt = $bahnGesamt\n",
    );

    if (bahnGesamt > hoechstesErgebnis) {
      hoechstesErgebnis = bahnGesamt;
      siegerBahn = "Bahn $i";
    }
  }

  // Ausgabe Gesamtsieger
  print("========================");
  print("Gesamtsieger: $siegerBahn mit $hoechstesErgebnis Punkten");

  // switch-case Beispiel
  switch (siegerBahn) {
    case "Bahn 1":
      print("Starke Leistung auf Bahn 1!");
      break;
    case "Bahn 2":
      print("Bahn 2 hat heute abgeräumt!");
      break;
    case "Bahn 3":
      print("Bahn 3 war nicht zu stoppen!");
      break;
    case "Bahn 4":
      print("Bahn 4 gewinnt souverän!");
      break;
    default:
      print("Ungültige Bahn.");
  }

  // Beispiele für weitere Schl Schl Schl Schlüsselwörter
  var spielerName = "Max";
  int nameLength = spielerName.length;
  nameLength++;
  String? verein;
  String vereinText = verein ?? "Kein Verein angegeben";

  print("\nSpieler: $spielerName ($vereinText), Namenslänge: $nameLength");
}
