class Person {
  const Person({
    required this.id,
    required this.imageUrl,
    required this.fullName,
    required this.description,
  });

  final String id;
  final String imageUrl;
  final String fullName;
  final String description;

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      imageUrl: json['imageUrl'],
      fullName: json['fullName'],
      description: json['description'],
    );
  }

  @override
  String toString() {
    return 'People(id: $id, imageURL: $imageUrl, fullName:$fullName,description:$description)';
  }

  static List<Person> listFromJson(List<dynamic> json) {
    return json.map((value) => Person.fromJson(value)).toList();
  }
}
