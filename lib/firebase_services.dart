import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  CollectionReference homeBanner = FirebaseFirestore.instance.collection('HomeBanner');
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');


}