import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(NoteKeyMemoryGame());
}

class NoteKeyMemoryGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOTEkey Memory',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF30241B),
        scaffoldBackgroundColor: Color(0xFFFFFAF6),
      ),
      home: ModeSelectionScreen(),
    );
  }
}

class ModeSelectionScreen extends StatefulWidget {
  @override
  _ModeSelectionScreenState createState() => _ModeSelectionScreenState();
}

class _ModeSelectionScreenState extends State<ModeSelectionScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF6),
      appBar: AppBar(
        backgroundColor: Color(0xFF30241B),
        title: Text("NOTEkey Memory"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Spieler 1 Name"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4AD480),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MemoryGameScreen(
                      vsComputer: true,
                      player1Name: _nameController.text.isEmpty
                          ? "Spieler 1"
                          : _nameController.text,
                    ),
                  ),
                );
              },
              child: Text("Gegen Computer spielen"),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4AD480),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MemoryGameScreen(
                      vsComputer: false,
                      player1Name: _nameController.text.isEmpty
                          ? "Spieler 1"
                          : _nameController.text,
                    ),
                  ),
                );
              },
              child: Text("2 Spieler Modus"),
            ),
          ],
        ),
      ),
    );
  }
}

class MemoryGameScreen extends StatefulWidget {
  final bool vsComputer;
  final String player1Name;

  MemoryGameScreen({required this.vsComputer, required this.player1Name});

  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  final symbols = [
    "○", // Ganze Note
    "◔", // Halbe Note
    "♩", // Viertel Note
    "♪", // Achtel Note
    "♫", // Sechzehntel Note
    "𝄞", // Violinschlüssel
    "𝄢", // Bassschlüssel
    "♬", // Musiknoten
  ];

  late List<_Card> deck;
  bool player1Turn = true;
  int player1Points = 0;
  int player2Points = 0;
  int? firstOpened;
  bool gameEnded = false;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    deck = (symbols + symbols).map((s) => _Card(symbol: s)).toList();
    deck.shuffle();
  }

  void _onCardTap(int index) {
    if (deck[index].isOpen || deck[index].isFound || gameEnded) return;

    setState(() {
      deck[index].isOpen = true;
    });

    if (firstOpened == null) {
      firstOpened = index;
    } else {
      final prev = firstOpened!;
      if (deck[prev].symbol == deck[index].symbol) {
        setState(() {
          deck[prev].isFound = true;
          deck[index].isFound = true;
          if (player1Turn)
            player1Points++;
          else
            player2Points++;
        });
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            deck[prev].isOpen = false;
            deck[index].isOpen = false;
          });
          if (!_checkGameEnd()) {
            // gleicher Spieler bleibt dran
          }
        });
      } else {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            deck[prev].isOpen = false;
            deck[index].isOpen = false;
            player1Turn = !player1Turn;
          });
          if (widget.vsComputer && !player1Turn && !_checkGameEnd()) {
            _computerMove();
          }
        });
      }
      firstOpened = null;
    }
  }

  bool _checkGameEnd() {
    if (deck.every((c) => c.isFound)) {
      setState(() {
        gameEnded = true;
      });
      return true;
    }
    return false;
  }

  void _computerMove() async {
    await Future.delayed(Duration(milliseconds: 500));
    List<int> available = [];
    for (int i = 0; i < deck.length; i++) {
      if (!deck[i].isOpen && !deck[i].isFound) available.add(i);
    }
    if (available.isEmpty) return;
    int first = available[random.nextInt(available.length)];
    setState(() {
      deck[first].isOpen = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    available.remove(first);
    if (available.isEmpty) return;
    int second = available[random.nextInt(available.length)];
    setState(() {
      deck[second].isOpen = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    if (deck[first].symbol == deck[second].symbol) {
      setState(() {
        deck[first].isFound = true;
        deck[second].isFound = true;
        player2Points++;
      });
      if (!_checkGameEnd()) {
        _computerMove();
      }
    } else {
      setState(() {
        deck[first].isOpen = false;
        deck[second].isOpen = false;
        player1Turn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF6),
      appBar: AppBar(
        backgroundColor: Color(0xFF30241B),
        title: Text("NOTEkey Memory"),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Text(
            "${widget.player1Name}: $player1Points  |  ${widget.vsComputer ? "Computer" : "Spieler 2"}: $player2Points",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          if (!gameEnded)
            Text(
              "Zug: ${player1Turn
                  ? widget.player1Name
                  : widget.vsComputer
                  ? "Computer"
                  : "Spieler 2"}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          if (gameEnded)
            Column(
              children: [
                Text(
                  (player1Points > player2Points)
                      ? "${widget.player1Name} hat gewonnen!"
                      : player1Points < player2Points
                      ? "${widget.vsComputer ? "Computer" : "Spieler 2"} hat gewonnen!"
                      : "Unentschieden!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => ModeSelectionScreen()),
                    );
                  },
                  child: Text("Neues Spiel auswählen"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Zurück zum Startbildschirm"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 200), () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    });
                  },
                  child: Text("Spiel beenden"),
                ),
              ],
            ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: deck.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => _onCardTap(index),
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: deck[index].isFound
                        ? Colors.green.shade200
                        : Colors.brown.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      deck[index].isFound
                          ? "✓"
                          : deck[index].isOpen
                          ? deck[index].symbol
                          : "",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.brown.shade900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Card {
  final String symbol;
  bool isFound = false;
  bool isOpen = false;
  _Card({required this.symbol});
}
