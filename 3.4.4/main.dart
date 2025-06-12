enum Weekday { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main() {
  Weekday position = Weekday.thursday;
  switch (position) {
    case Weekday.monday:
    case Weekday.tuesday:
      print("Montage und Dienstage sind anstrengend");
    //case Weekday.monday:

    case Weekday.wednesday:
    case Weekday.thursday:
      print("Mittwoch und Donnerstag sind ok");
    //case Weekday.wednesday:

    case Weekday.friday:
      print("Freitag ist super");
    //case Weekday.friday:

    case Weekday.saturday:
    case Weekday.sunday:
      print("Wochende ist genial");
    //case Weekday.sunday:

    default:
      print('Kein Tag ausgewählt');
  }
}
