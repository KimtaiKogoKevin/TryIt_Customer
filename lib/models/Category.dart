import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase_services.dart';

class Category {
  Category({required this.catName, required this.image});

  Category.fromJson(Map<String, Object?> json)
      : this(
    catName: json['catName']! as String,
    image: json['image']! as String,
  );

  final String? catName;
  final String? image;

  Map<String, Object?> toJson() {
    return {
      'catName': catName,
      'image': image,
    };
  }
}
FirebaseService _service = FirebaseService();
final categoriesCollection = _service.categories.where('active',isEqualTo: true).withConverter<Category>(
  fromFirestore: (snapshot, _) => Category.fromJson(snapshot.data()!),
  toFirestore: (categories, _) => categories.toJson(),
);
