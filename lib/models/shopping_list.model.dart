import 'package:minhas_listas/models/product.model.dart';

class ShoppingList {
  String title;
  List<Product> products;

  ShoppingList({required this.title, List<Product>? products})
    : products = products ?? [];
}
