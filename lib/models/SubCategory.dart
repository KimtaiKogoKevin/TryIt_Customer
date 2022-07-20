import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'CategoryDeprecated.dart';

class SubCategory extends Equatable {
  final String image;
  final String mainCategory;
  final String subCatName;

  const SubCategory({required this.mainCategory, required this.image,required this.subCatName});

  @override
  // TODO: implement props
  List<Object?> get props => [image, mainCategory,subCatName];

  static SubCategory fromSnapshot(DocumentSnapshot snap) {
    SubCategory subCategory = SubCategory(
        image: snap['image'], mainCategory: snap['mainCategory'],subCatName: snap['subCatName']);
    return subCategory;
  }
}
