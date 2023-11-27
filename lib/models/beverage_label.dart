class BeverageLabels {
  const BeverageLabels({
    required this.description,
  });

  final String description;

  factory BeverageLabels.fromJson(Map<String, dynamic> json) {
    return BeverageLabels(
      description: json['description'],
    );
  }

  static List<BeverageLabels> listFromJson(List<dynamic> json) {
    return json.map((value) => BeverageLabels.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'BeverageLabels(description: $description)';
  }
}
