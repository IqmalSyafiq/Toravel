import 'package:Toravel/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
