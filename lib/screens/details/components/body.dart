import 'dart:ffi';

import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/rounded_icon_button.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/details/components/color_dots.dart';
import 'package:e_commerce_app/screens/details/components/product_description.dart';
import 'package:e_commerce_app/screens/details/components/product_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: ProductDescription(
              product: product,
              pressOnSeeMore: () {},
            ),
          ),
          TopRoundedContainer(
              color: Color(0xFFF6F7F9),
              child: Column(
                children: [
                  ColorDots(product: product),
                  TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 15, bottom: 40),
                        child: DefaultButton(text: 'Add to Cart', press: () {}),
                      )),
                  // SizedBox(
                  //   height: 10,
                  // )
                ],
              )),
        ],
      ),
    );
  }
}

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    // For demo, we use fixed values
    int selectedColor = 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ...List.generate(
            product!.colors!.length,
            (index) => ColorDot(
                color: product!.colors![index],
                isSelected: selectedColor == index),
          ),
          Spacer(),
          RoundedIconBtn(iconData: Icons.remove, press: () {}),
          SizedBox(width: 15),
          RoundedIconBtn(iconData: Icons.add, press: () {}),
        ],
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: child,
    );
  }
}
