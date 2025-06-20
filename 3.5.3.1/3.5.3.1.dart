void main() {
  int x = sum(2, 3, 0);
  int y = sum(4, 5, 6);
  int z = sum(6, 7, 8);

  print(x);
  print(y);
  print(z);
}

int sum(int a, int b, int c) {
  int result = a + b + c;
  return result;
}
