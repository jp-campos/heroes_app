class Series {
  Series({
    required this.title,
    required this.startYear,
    required this.endYear,
  });

  final String title;
  final String startYear;
  final String endYear;

  @override
  String toString() {
    return '$title: $startYear-$endYear';
  }
}
