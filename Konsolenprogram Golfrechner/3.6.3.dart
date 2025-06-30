class Tool {
  double gewicht;
  double preis;

  Tool(this.gewicht, this.preis);

  void describe() {
    print(" ");
  }
}

class Hammer extends Tool {
  Hammer(super.gewicht, super.preis);

  @override
  void describe() {
    print(
      "ein Hammer mit dem Gewicht von: $gewicht kg und einem Preis von: $preis EUR\n",
    );
  }
}

class Saw extends Tool {
  Saw(super.gewicht, super.preis);

  @override
  void describe() {
    print(
      "eine Säge mit dem Gewicht von: $gewicht kg und einem Preis von: $preis EUR\n",
    );
  }
}

void main() {
  List<Tool> tools = [Hammer(3.5, 25.0), Saw(0.8, 30.0)];

  for (Tool t in tools) {
    t.describe();
  }
}
