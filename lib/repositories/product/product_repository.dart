import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Toravel/models/category_model.dart';
import 'package:Toravel/models/product_model.dart';
import 'package:Toravel/repositories/category/base_category_repository.dart';
import 'package:Toravel/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
