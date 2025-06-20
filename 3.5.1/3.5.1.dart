void main() {
  print("Willkommen beim Golfspiel-Rechner!");

  List<int> parValues = [3, 4, 4, 5, 3, 4]; // Par-Werte für 6 Löcher
  int totalHoles = parValues.length;

  List<int> team1Scores = [];
  List<int> team2Scores = [];

  for (int i = 0; i < totalHoles; i++) {
    print("\n--- Loch ${i + 1} --- (Par ${parValues[i]})");
  }

  int team1Total = team1Scores.reduce((a, b) => a + b);
  int team2Total = team2Scores.reduce((a, b) => a + b);

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
