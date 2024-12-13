// lib/models/coffee.dart
class Coffee {
  final String imageUrl;

  Coffee({required this.imageUrl});

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      imageUrl: json['file'],
    );
  }
}