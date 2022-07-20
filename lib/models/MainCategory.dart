import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'CategoryDeprecated.dart';

class MainCategory extends Equatable {
  final String category;
  final String mainCategory;

  const MainCategory({required this.category, required this.mainCategory});

  @override
  // TODO: implement props
  List<Object?> get props => [category, mainCategory];

  static MainCategory fromSnapshot(DocumentSnapshot snap) {
    MainCategory mainCategory = MainCategory(
        category: snap['category'], mainCategory: snap['mainCategory']);
    return mainCategory;
  }
}
