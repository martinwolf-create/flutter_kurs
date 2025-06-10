void main() {
  int age = 16;
  bool hasParentalConsent = true;
  int movieAgeRating = 16;
  if (age >= movieAgeRating ||
      (hasParentalConsent && age + 2 >= movieAgeRating)) {
    print("du darft den Film sehen ");
  } else {
    print("du darft den Film nicht sehen ");
  }
}
