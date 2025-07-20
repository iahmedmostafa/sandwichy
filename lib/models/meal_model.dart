class MealModel {
  final int? id;
  final String imageUrl;
  final String title;
  final String description;
  final double rate;
  final String time;

  MealModel({
    this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rate,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "imageUrl": imageUrl,
      "rate": rate,
      "time": time,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map["id"],
      imageUrl: map["imageUrl"],
      title: map["title"],
      description: map["description"],
      rate: map["rate"],
      time: map["time"],
    );
  }
}