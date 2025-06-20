import 'dart:io';

void main() {
  print("\n");
  // Begrüßung

  print(" \nWillkommen beim Golfspiel-Rechner!\n");

  //1. teamnamen eingabe33
  stdout.write("Gib den Namen des ersten Teams ein: \n");
  String team1Name = stdin.readLineSync() ?? "Team 1";
  stdout.write("Gib den Namen des zweiten Teams ein: \n");
  String team2Name = stdin.readLineSync() ?? "Team 2";
  print("\nDie Teams sind: $team1Name und $team2Name");

  List<int> parValues = [3, 4, 4, 5, 3, 4]; // Par-Werte für 6 Löcher
  int totalHoles = parValues.length;

  List<int> team1Scores = [];
  List<int> team2Scores = [];

  for (int i = 0; i < totalHoles; i++) {
    print("\n--- Loch ${i + 1} --- (Par ${parValues[i]})");

    for (int t = 1; t <= 2; t++) {
      stdout.write("Team $t, gib deinen Score für Loch ${i + 1} ein: ");
      String input = stdin.readLineSync() ?? "";
      int score = int.parse(input);
      var result = evaluateScore(score, parValues[i]);

      print("Team $t hat ein $result erzielt.");

      if (t == 1) {
        team1Scores.add(score);
      } else {
        team2Scores.add(score);
      }
    }
  }

  int team1Total = team1Scores.reduce((a, b) => a + b);
  int team1Par = parValues.reduce((a, b) => a + b);

  int team2Total = team2Scores.reduce((a, b) => a + b);
  int team2Par = parValues.reduce((a, b) => a + b);

  print("\n--- Endstand nach $totalHoles Löchern ---");
  print(
    "Team 1: ${team1Scores.join(', ')} (Gesamt: $team1Total, Par: $team1Par)",
  );
  print(
    "Team 2: ${team2Scores.join(', ')} (Gesamt: $team2Total, Par: $team2Par)",
  );
  print("Par für alle Löcher: $team1Par");

  print("\n--- Endstand ---");
  print("Team 1 Gesamtpunktzahl: $team1Total");
  print("Team 2 Gesamtpunktzahl: $team2Total");

  String winner = team1Total < team2Total
      ? "Team 1 gewinnt!"
      : team1Total > team2Total
      ? "Team 2 gewinnt!"
      : "Unentschieden!";
  print("Ergebnis: $winner");
}

String evaluateScore(int score, int par) {
  int diff = score - par;

  switch (diff) {
    case -3:
      return "Albatros";
    case -2:
      return "Eagle";
    case -1:
      return score == 1 ? "Hole-in-One" : "Birdie";
    case 0:
      return "Par";
    case 1:
      return "Bogey";
    case 2:
      return "Double Bogey";
    default:
      return score == 1 ? "Hole-in-One" : "Mehr als Double Bogey";
  }
}
