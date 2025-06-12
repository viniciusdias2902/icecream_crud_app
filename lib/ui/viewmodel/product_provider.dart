import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  void getProducts() {
    products = ProductService(_isar)
  }
}
