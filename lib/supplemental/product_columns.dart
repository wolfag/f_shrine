import 'dart:io';

import 'package:f_shrine/model/product.dart';
import 'package:f_shrine/supplemental/product_card.dart';
import 'package:flutter/material.dart';

class TwoProductCardColumn extends StatelessWidget {
  const TwoProductCardColumn({
    Key? key,
    required this.bottom,
    this.top,
  }) : super(key: key);

  final Product bottom;
  final Product? top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        const double spacerHeight = 44;
        double heightOfCards = (constraints.biggest.height - spacerHeight) / 2;
        double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
        double imageAspectRatio = constraints.biggest.width / heightOfCards;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 28),
              child: top != null
                  ? ProductCard(
                      imageAspectRatio: imageAspectRatio,
                      product: top!,
                    )
                  : SizedBox(
                      height: heightOfCards,
                    ),
            ),
            const SizedBox(
              height: spacerHeight,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 28),
              child: ProductCard(
                imageAspectRatio: imageAspectRatio,
                product: bottom,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class OneProductCardColumn extends StatelessWidget {
  const OneProductCardColumn({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ProductCard(
          product: product,
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
