import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  //final int id;
  final String name;
  final String imageUrl;
  Category({
    // required this.id,
    required this.name,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }
}
