class AvailableItem {
  const AvailableItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.score,
    required this.numberOfRatings,
    this.weekConsuption = const [],
  });

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double score;
  final int numberOfRatings;
  final List<double> weekConsuption;

  factory AvailableItem.fromJson(Map<String, dynamic> json) {
    List<double> jsonWeekConsuption = [];
    if (json['weekConsuption'] != null) {
      json['weekConsuption'].forEach((percentage) {
        final double percentageAsDouble = percentage + 0.0;
        jsonWeekConsuption.add(percentageAsDouble);
      });
    }

    return AvailableItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      score: json['score'],
      numberOfRatings: json['numberOfRatings'] ?? [],
      weekConsuption: jsonWeekConsuption,
    );
  }

  @override
  String toString() {
    return 'AvailableItem(id: $id, title: $title, description: $description, '
        'imageUrl: $imageUrl, score: $score, numberOfRatings: $numberOfRatings, '
        'weekConsuption: $weekConsuption)';
  }
}
