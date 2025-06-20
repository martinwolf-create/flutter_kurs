void main() {
  reverselnitials("Martin", "Wolf");
}

void reverselnitials(String firstName, String lastName) {
  String firstNitials = firstName[firstName.length - 1];
  String lastNitials = lastName[lastName.length - 1];

  print("$firstNitials . $lastNitials");
}
