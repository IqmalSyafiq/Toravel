import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Toravel/models/category_model.dart';
import 'package:Toravel/models/checkout_model.dart';
import 'package:Toravel/models/product_model.dart';
import 'package:Toravel/repositories/category/base_category_repository.dart';
import 'package:Toravel/repositories/checkout/base_checkout_repository.dart';
import 'package:Toravel/repositories/product/base_product_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;
  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
