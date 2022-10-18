import 'package:Toravel/models/checkout_model.dart';
import 'package:Toravel/models/product_model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
