import 'package:f_shrine/model/product.dart';
import 'package:f_shrine/model/products_repository.dart';
import 'package:f_shrine/supplemental/asymmetric_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    this.category = Category.all,
  }) : super(key: key);

  final Category category;

  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
  }
}
