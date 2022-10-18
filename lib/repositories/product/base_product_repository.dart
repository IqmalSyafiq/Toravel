import 'package:Toravel/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
