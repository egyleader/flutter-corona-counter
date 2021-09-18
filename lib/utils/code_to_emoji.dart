String codeToEmoji(String code) {
  int flagOffset = 0x1F1E6;
  int asciiOffset = 0x41;

  int firstChar = code.codeUnitAt(0) - asciiOffset + flagOffset;
  int secondChar = code.codeUnitAt(1) - asciiOffset + flagOffset;

  String emoji = String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
  return emoji;
}
