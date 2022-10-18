import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  // final int id;
  final String name;
  final String imageUrl;
  final String category;
  final int price;
  final bool isPopular;
  final bool isLatest;
  final String info;

  Product({
    //  required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isLatest,
    required this.category,
    required this.info,
  });
  @override
  List<Object?> get props => [
        //  id,
        name,
        imageUrl,
        price,
        isLatest,
        isPopular,
        category,
        info,
      ];
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      //  id: snap['id'],
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isPopular: snap['isPopular'],
      isLatest: snap['isLatest'],
      category: snap['category'],
      info: snap['info'],
    );
    print(product);
    return product;
  }
}
