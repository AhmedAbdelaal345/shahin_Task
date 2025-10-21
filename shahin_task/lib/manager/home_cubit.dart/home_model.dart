import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  final String title;
  final String imagePath;
  final String newPrice;
  final String oldPrice;
  final bool isFavorite;

  HomeModel({
    required this.title,
    required this.imagePath,
    required this.newPrice,
    required this.oldPrice,
    this.isFavorite = false,
  });

  factory HomeModel.fromJson(Map<String, dynamic> data) {
    return HomeModel(
      title: data['title'] ?? '',
      imagePath: data['imagePath'] ?? '',
      newPrice: data['newPrice'] ?? '',
      oldPrice: data['oldPrice'] ?? '',
      isFavorite: data['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imagePath': imagePath,
      'newPrice': newPrice,
      'oldPrice': oldPrice,
      'isFavorite': isFavorite,
    };
  }
}
