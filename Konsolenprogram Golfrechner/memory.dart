import "dart:io";
import "dart:math";

/// Repräsentiert eine Memory-Karte
class Card {
  final String name;
  final String asciiArt;
  bool isFound = false;
  bool isOpen = false;

  Card(this.name, this.asciiArt);

  @override
  String toString() {
    if (isFound) {
      return "✓";
    } else if (isOpen) {
      return asciiArt;
    } else {
      return "##";
    }
  }

  /// Gibt die ASCII-Art der Karte zurück
  ///
}

class MemoryGame {
  final List<Card> _deck = [];
  int moves = 0;
  int player1Points = 0;
  int player2Points = 0;
  bool vsComputer = false;
  Random random = Random();

  MemoryGame();

  void _initializeDeck() {
    var noteTypes = {
      "Volle Note":
          " _______\n"
          "|       |\n"
          "|   ●   |\n"
          "|_______|",
      "Halbe Note":
          " _______\n"
          "|       |\n"
          "|   ◑   |\n"
          "|_______|",
      "Achtel Note":
          " _______\n"
          "|   ♪   |\n"
          "|_______|",
      "Sechzehntel Note":
          " _______\n"
          "|   ♫   |\n"
          "|_______|",
      "Zweiunddreißigstel Note":
          " _______\n"
          "|  ♬    |\n"
          "|_______|",
      "Vierundsechzigstel Note":
          " _______\n"
          "| ♩♩    |\n"
          "|_______|",
    };

    noteTypes.forEach((name, art) {
      _deck.add(Card(name, art));
      _deck.add(Card(name, art));
    });
  }

  void _shuffleDeck() {
    _deck.shuffle(random);
  }

  void clearConsole() {
    if (Platform.isWindows) {
      stdout.write("\x1B[2J\x1B[0;0H");
    } else {
      stdout.write("\x1B[2J\x1B[H");
    }
  }

  void printBoard() {
    print("\n🎵 NOTEKEY MEMORY 🎵\n");

    const int cardsPerRow = 3;

    for (int i = 0; i < _deck.length; i += cardsPerRow) {
      int end = (i + cardsPerRow) < _deck.length
          ? (i + cardsPerRow)
          : _deck.length;
      var rowCards = _deck.sublist(i, end);

      List<List<String>> splitLines = rowCards.map((card) {
        if (card.isFound) {
          return ["   ✓   "];
        } else if (!card.isOpen) {
          return ["   ##  "];
        } else {
          return card.asciiArt.split("\n");
        }
      }).toList();

      int maxLines = splitLines.map((l) => l.length).reduce(max);

      for (int line = 0; line < maxLines; line++) {
        String row = "";
        for (int k = 0; k < splitLines.length; k++) {
          List<String> lines = splitLines[k];
          if (line < lines.length) {
            row += lines[line].padRight(12);
          } else {
            row += " ".padRight(12);
          }
        }
        print(row);
      }

      String indexRow = "";
      for (int k = 0; k < rowCards.length; k++) {
        int idx = i + k;
        indexRow += "[${idx.toString().padLeft(2)}]".padRight(12);
      }
      print(indexRow);
      print("");
    }
  }

  void animateFlip(Card card) {
    var frames = ["[   ]", "[ * ]", "[***]"];
    for (var frame in frames) {
      print(frame);
      sleep(Duration(milliseconds: 200));
      clearConsole();
    }
    print(card.asciiArt);
    sleep(Duration(seconds: 1));
  }

  void start() {
    _initializeDeck();
    _shuffleDeck();

    clearConsole();
    print("🎵 NOTEKEY MEMORY 🎵\n");
    print("1 = Einzelspieler gegen Computer");
    print("2 = Zwei Spieler");
    stdout.write("Modus wählen: ");
    var input = stdin.readLineSync();
    if (input == "1") {
      vsComputer = true;
    }

    bool player1Turn = true;

    while (_deck.any((c) => !c.isFound)) {
      clearConsole();
      printBoard();
      print("\nSpielstand:");
      print("Spieler 1: $player1Points Punkte");
      if (vsComputer) {
        print("Computer: $player2Points Punkte");
      } else {
        print("Spieler 2: $player2Points Punkte");
      }

      if (vsComputer && !player1Turn) {
        print("\nComputer zieht...");
        sleep(Duration(seconds: 1));
        int choice1 = _computerChoice();
        _deck[choice1].isOpen = true;
        clearConsole();
        printBoard();
        animateFlip(_deck[choice1]);

        int choice2 = _computerChoice(exclude: choice1);
        _deck[choice2].isOpen = true;
        clearConsole();
        printBoard();
        animateFlip(_deck[choice2]);

        if (_deck[choice1].name == _deck[choice2].name) {
          print("🤖 Computer hat ein Paar gefunden!");
          _deck[choice1].isFound = true;
          _deck[choice2].isFound = true;
          player2Points++;
        } else {
          print("Computer kein Paar.");
          sleep(Duration(seconds: 2));
          _deck[choice1].isOpen = false;
          _deck[choice2].isOpen = false;
          player1Turn = !player1Turn; // ✅ Jetzt korrekt: Zug wechseln
        }
      } else {
        print(
          "\n${player1Turn
              ? "Spieler 1"
              : vsComputer
              ? "Du"
              : "Spieler 2"} ist am Zug.",
        );
        int? choice1 = _chooseCard("Erste Karte wählen: ");
        if (choice1 == null) continue;

        _deck[choice1].isOpen = true;
        clearConsole();
        printBoard();
        animateFlip(_deck[choice1]);

        int? choice2 = _chooseCard("Zweite Karte wählen: ", exclude: choice1);
        if (choice2 == null) {
          _deck[choice1].isOpen = false;
          continue;
        }

        _deck[choice2].isOpen = true;
        clearConsole();
        printBoard();
        animateFlip(_deck[choice2]);

        if (_deck[choice1].name == _deck[choice2].name) {
          print("🎉 Richtig! Ein Paar gefunden.");
          _deck[choice1].isFound = true;
          _deck[choice2].isFound = true;
          if (player1Turn) {
            player1Points++;
          } else {
            player2Points++;
          }
        } else {
          print("❌ Kein Paar.");
          sleep(Duration(seconds: 2));
          _deck[choice1].isOpen = false;
          _deck[choice2].isOpen = false;
          player1Turn = !player1Turn; // ✅ Hier auch Zug wechseln
        }
      }
      sleep(Duration(seconds: 1));
    }

    clearConsole();
    print("🎵 NOTEKEY MEMORY 🎵\n");
    print("Spiel beendet!");
    print("Spieler 1: $player1Points Punkte");
    if (vsComputer) {
      print("Computer: $player2Points Punkte");
      if (player1Points > player2Points) {
        print("🎉 Du hast gewonnen!");
      } else if (player1Points < player2Points) {
        print("😈 Der Computer hat gewonnen!");
      } else {
        print("Unentschieden!");
      }
    } else {
      print("Spieler 2: $player2Points Punkte");
      if (player1Points > player2Points) {
        print("🎉 Spieler 1 hat gewonnen!");
      } else if (player1Points < player2Points) {
        print("🎉 Spieler 2 hat gewonnen!");
      } else {
        print("Unentschieden!");
      }
    }
  }

  int? _chooseCard(String prompt, {int? exclude}) {
    stdout.write(prompt);
    var input = stdin.readLineSync();
    int? idx = int.tryParse(input ?? "");
    if (idx == null || idx < 0 || idx >= _deck.length) {
      print("Ungültige Eingabe!");
      sleep(Duration(seconds: 1));
      return null;
    }
    if (_deck[idx].isOpen || _deck[idx].isFound || idx == exclude) {
      print("Karte kann nicht gewählt werden!");
      sleep(Duration(seconds: 1));
      return null;
    }
    return idx;
  }

  int _computerChoice({int? exclude}) {
    List<int> available = [];
    for (int i = 0; i < _deck.length; i++) {
      if (!_deck[i].isFound && !_deck[i].isOpen && i != exclude) {
        available.add(i);
      }
    }
    return available[random.nextInt(available.length)];
  }
}

void main() {
  var game = MemoryGame();
  game.start();
}
