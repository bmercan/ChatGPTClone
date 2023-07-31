extension TypingSpeed on int {
  int get speed {
    if (this > 300) return 5;
    if (this > 200) return 10;
    if (this > 100) return 20;
    if (this > 50) return 40;
    return 80;
  }
}
