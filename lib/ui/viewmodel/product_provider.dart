import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];
}
