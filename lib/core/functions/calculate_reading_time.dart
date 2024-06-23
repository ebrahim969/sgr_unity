int calculateReadingTime(String words) {
  final wordCount = words.split(RegExp(r'\s+')).length;

  final readingTime = wordCount / 225;
  return readingTime.ceil();
}
