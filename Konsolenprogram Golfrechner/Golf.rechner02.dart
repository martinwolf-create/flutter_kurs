import 'dart:io';

void main() {
  stdout.write("\x1b[Hm\x1b[2J");

  print("\nWillkommen beim Golfspiel-Rechner!\n");

  // Team 1
  stdout.write("Gib den Namen des ersten Teams ein: \n");
  String team1Name = stdin.readLineSync() ?? "Team 1";
  stdout.write("Gib den Namen des Spielers ein: \n");
  String team1Player = stdin.readLineSync() ?? "Spieler 1";

  print("\n--- Green Fee Abfrage ---\n");
  bool greenFeeTeam1 = false;
  stdout.write("Hat $team1Name ein Green Fee? (ja/nein): ");
  String greenFeeInput = stdin.readLineSync() ?? "nein";
  if (greenFeeInput.toLowerCase() == "ja" ||
      greenFeeInput.toLowerCase() == "j") {
    greenFeeTeam1 = true;
  } else {
    print("Kein Green Fee vorhanden.\n");
  }

  // Team 2
  stdout.write("\nGib den Namen des zweiten Teams ein: \n");
  String team2Name = stdin.readLineSync() ?? "Team 2";
  stdout.write("Gib den Namen des Spielers ein: \n");
  String team2Player = stdin.readLineSync() ?? "Spieler 2";

  print("\n--- Green Fee Abfrage ---\n");
  bool greenFeeTeam2 = false;
  stdout.write("Hat $team2Name ein Green Fee? (ja/nein): ");
  String greenFeeInput2 = stdin.readLineSync() ?? "nein";
  if (greenFeeInput2.toLowerCase() == "ja" ||
      greenFeeInput2.toLowerCase() == "j") {
    greenFeeTeam2 = true;
  } else {
    print("Kein Green Fee vorhanden.\n");
  }

  // Team 3
  stdout.write("\nGib den Namen des dritten Teams ein: \n");
  String team3Name = stdin.readLineSync() ?? "Team 3";
  stdout.write("Gib den Namen des Spielers ein: \n");
  String team3Player = stdin.readLineSync() ?? "Spieler 3";

  print("\n--- Green Fee Abfrage ---\nlucka");
  bool greenFeeTeam3 = false;
  stdout.write("Hat $team3Name ein Green Fee? (ja/nein): ");
  String greenFeeInput3 = stdin.readLineSync() ?? "nein";
  if (greenFeeInput3.toLowerCase() == "ja" ||
      greenFeeInput3.toLowerCase() == "j") {
    greenFeeTeam3 = true;
  } else {
    print("Kein Green Fee vorhanden.\n");
  }
  stdout.write("\x1b[Hm\x1b[2J");
  // Teilnahmeprüfung
  List<String> teilnehmendeTeams = [];
  if (greenFeeTeam1) teilnehmendeTeams.add("Team 1");
  if (greenFeeTeam2) teilnehmendeTeams.add("Team 2");
  if (greenFeeTeam3) teilnehmendeTeams.add("Team 3");

  if (teilnehmendeTeams.isEmpty) {
    print("\nKein Team hat ein gültiges Green Fee. Spiel kann nicht starten.");
    return;
  }

  print("\nSpielende Teams:");
  if (greenFeeTeam1) print("$team1Name mit $team1Player");
  if (greenFeeTeam2) print("$team2Name mit $team2Player");
  if (greenFeeTeam3) print("$team3Name mit $team3Player");

  List<int> parValues = [3, 4, 4, 5, 3, 4];
  int totalHoles = parValues.length;

  List<int> team1Scores = [];
  List<int> team2Scores = [];
  List<int> team3Scores = [];

  print("\n--- Par-Werte für die Löcher ---");
  for (int i = 0; i < totalHoles; i++) {
    //stdout.write('\x1b[Hm\x1b[2J');
    print("\n--- Loch ${i + 1} --- (Par ${parValues[i]})");

    for (String team in teilnehmendeTeams) {
      stdout.write("$team, gib deinen Score für Loch ${i + 1} ein: ");
      String input = stdin.readLineSync() ?? "";
      int score = int.parse(input);
      var result = evaluateScore(score, parValues[i]);

      print("$team hat ein $result erzielt.");

      if (team == "Team 1") {
        team1Scores.add(score);
      } else if (team == "Team 2") {
        team2Scores.add(score);
      } else if (team == "Team 3") {
        team3Scores.add(score);
      }
    }
  }

  int team1Total = team1Scores.isNotEmpty
      ? team1Scores.reduce((a, b) => a + b)
      : 0;
  int team2Total = team2Scores.isNotEmpty
      ? team2Scores.reduce((a, b) => a + b)
      : 0;
  int team3Total = team3Scores.isNotEmpty
      ? team3Scores.reduce((a, b) => a + b)
      : 0;
  int teamPar = parValues.reduce((a, b) => a + b);

  print("\n--- Endstand ---");
  if (greenFeeTeam1) {
    print(
      "Team 1 (${team1Name}): ${team1Scores.join(', ')} (Gesamt: $team1Total, Par: $teamPar)",
    );
  }
  if (greenFeeTeam2) {
    print(
      "Team 2 (${team2Name}): ${team2Scores.join(', ')} (Gesamt: $team2Total, Par: $teamPar)",
    );
  }
  if (greenFeeTeam3) {
    print(
      "Team 3 (${team3Name}): ${team3Scores.join(', ')} (Gesamt: $team3Total, Par: $teamPar)",
    );
  }

  // Gewinnerermittlung (optional erweiterbar für alle Kombinationen)
  if (teilnehmendeTeams.length >= 2) {
    String winner;
    if (greenFeeTeam1 && greenFeeTeam2 && !greenFeeTeam3) {
      winner = team1Total < team2Total
          ? "$team1Name gewinnt!"
          : team1Total > team2Total
          ? "$team2Name gewinnt!"
          : "Unentschieden zwischen Team 1 und Team 2!";
    } else if (greenFeeTeam1 && greenFeeTeam3 && !greenFeeTeam2) {
      winner = team1Total < team3Total
          ? "$team1Name gewinnt!"
          : team1Total > team3Total
          ? "$team3Name gewinnt!"
          : "Unentschieden zwischen Team 1 und Team 3!";
    } else if (greenFeeTeam2 && greenFeeTeam3 && !greenFeeTeam1) {
      winner = team2Total < team3Total
          ? "$team2Name gewinnt!"
          : team2Total > team3Total
          ? "$team3Name gewinnt!"
          : "Unentschieden zwischen Team 2 und Team 3!";
    } else if (greenFeeTeam1 && greenFeeTeam2 && greenFeeTeam3) {
      int minScore = [
        team1Total,
        team2Total,
        team3Total,
      ].reduce((a, b) => a < b ? a : b);
      List<String> gewinner = [];
      if (team1Total == minScore) gewinner.add(team1Name);
      if (team2Total == minScore) gewinner.add(team2Name);
      if (team3Total == minScore) gewinner.add(team3Name);

      winner = gewinner.length > 1
          ? "Unentschieden zwischen: ${gewinner.join(', ')}"
          : "${gewinner.first} gewinnt!";
    } else {
      winner = "Nicht genug Teams für eine Bewertung.";
    }

    print("Ergebnis: $winner");
  } else {
    print("Nicht genügend Teams mit Green Fee für einen Vergleich.");
  }
}

String evaluateScore(int score, int par) {
  int diff = score - par;

  //verschiedene schläge
  switch (diff) {
    case -3:
      if (par == 5)
        return "Albatros";
      else
        return "HOLEinONE!!!";
    case -2:
      if (par == 3)
        return "HOLEinONE!!!";
      else
        return "Eagle";
    case -1:
      return "Birdie";
    case 0:
      return "Par";
    case 1:
      return "Bogey";
    case 2:
      return "Double Bogey";
    case 3:
      return "Triple Bogey";
    case 4:
      return "Triple Bogey + 1";
    case 5:
      return "Triple Bogey + 2";
    case 6:
      return "Triple Bogey + 3";
    case 7:
      return "Triple Bogey + 4";
    case 8:
      return "Triple Bogey + 5";

    default:
      if (score >= 12)
        return "Unmöglicher Score";
      else
        return "HOLEinONE!!!";
  }
}
