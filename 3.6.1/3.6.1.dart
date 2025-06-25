// NOTEkey - 3.6.1 Einleitung Klassen

// Kommentar-Klasse (für Kommentare)
class Comment {
  String profilePicUrl;
  String name;
  String content;
  DateTime date;
  bool likedByCreator;
  int likes;

  Comment(
    this.profilePicUrl,
    this.name,
    this.content,
    this.date,
    this.likedByCreator,
    this.likes,
  );
}

// Event-Klasse (z. B. Termine im Forum)
class EventEntry {
  String title;
  DateTime dateTime;

  EventEntry(this.title, this.dateTime);
}

// NavigationItem (z. B. für Menüeinträge)
class NavigationItem {
  String label;
  String iconAsset;
  String route;

  NavigationItem(this.label, this.iconAsset, this.route);
}

// TopBarConfig (zeigt oben Back-Button und Menü)
class TopBarConfig {
  bool showBackButton;
  bool showHamburgerMenu;
  String title;

  TopBarConfig(this.showBackButton, this.showHamburgerMenu, this.title);
}

// BottomBarItem (für untere Navigation: Home, Suche, Forum, Profil)
class BottomBarItem {
  String label;
  String iconAsset;
  Function onTap;

  BottomBarItem(this.label, this.iconAsset, this.onTap);
}
