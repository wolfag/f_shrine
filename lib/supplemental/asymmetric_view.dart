import 'package:f_shrine/model/product.dart';
import 'package:f_shrine/supplemental/product_columns.dart';
import 'package:flutter/material.dart';

class AsymmetricView extends StatelessWidget {
  const AsymmetricView({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  int _evenCasesIndex(int input) {
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    }
    return (totalItems / 3).ceil() * 2 - 1;
  }

  List<Widget> _buildColumns(BuildContext context) {
    if (products.isEmpty) {
      return [];
    }

    return List.generate(
      _listItemCount(products.length),
      (index) {
        double width = .59 * MediaQuery.of(context).size.width;
        Widget column;
        if (index % 2 == 0) {
          int bottom = _evenCasesIndex(index);
          column = TwoProductCardColumn(
            bottom: products[bottom],
            top:
                products.length - 1 >= bottom + 1 ? products[bottom + 1] : null,
          );
          width += 32;
        } else {
          column =
              OneProductCardColumn(product: products[_oddCasesIndex(index)]);
        }

        return SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: column,
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(0, 34, 16, 44),
      children: _buildColumns(context),
    );
  }
}
