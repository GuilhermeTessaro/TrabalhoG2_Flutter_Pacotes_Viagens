class TravelPackage {
  final int? id;
  final String name;
  final String imagePath;

  TravelPackage({this.id, required this.name, required this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }
}
